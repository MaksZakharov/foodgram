from api.filters import RecipeFilter
from api.permissions import IsAuthorOrReadOnly
from django.db.models import Sum
from django.http import HttpResponse
from django.shortcuts import get_object_or_404
from django_filters.rest_framework import DjangoFilterBackend
from rest_framework import permissions, status, viewsets
from rest_framework.decorators import action
from rest_framework.filters import BaseFilterBackend
from rest_framework.response import Response

from .models import (Favorite, Ingredient, IngredientAmount, Recipe,
                     ShoppingCart, Tag)
from .serializers import (IngredientSerializer, RecipeReadSerializer,
                          RecipeWriteSerializer, TagSerializer)
from .short_serializers import ShortRecipeSerializer


class RecipeViewSet(viewsets.ModelViewSet):
    """
    Вьюсет для рецептов.

    Поддерживает:
    - CRUD операции;
    - добавление и удаление из избранного;
    - добавление и удаление из списка покупок;
    - скачивание списка покупок;
    - фильтрацию по тегам и авторам;
    - генерацию короткой ссылки.
    """

    queryset = Recipe.objects.all()
    permission_classes = (IsAuthorOrReadOnly,)
    filter_backends = [DjangoFilterBackend]
    filterset_class = RecipeFilter

    def get_serializer_class(self):
        """Возвращает сериализатор в зависимости от метода запроса."""
        if self.request.method in ('POST', 'PATCH', 'PUT'):
            return RecipeWriteSerializer
        return RecipeReadSerializer

    def _serialize_recipe(self, recipe):
        """Сериализует рецепт для ответа после create/update."""
        serializer = RecipeReadSerializer(
            recipe, context={'request': self.request}
        )
        return serializer.data

    def perform_create(self, serializer):
        """Создаёт рецепт с автором."""
        recipe = serializer.save(author=self.request.user)
        self.response_data = self._serialize_recipe(recipe)

    def perform_update(self, serializer):
        """Обновляет рецепт и сериализует его для ответа."""
        recipe = serializer.save()
        self.response_data = self._serialize_recipe(recipe)

    def create(self, request, *args, **kwargs):
        """Создаёт рецепт и возвращает сериализованные данные."""
        serializer = self.get_serializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        self.perform_create(serializer)
        return Response(self.response_data, status=status.HTTP_201_CREATED)

    def update(self, request, *args, **kwargs):
        """Обновляет рецепт и возвращает сериализованные данные."""
        partial = kwargs.pop('partial', False)
        instance = self.get_object()
        serializer = self.get_serializer(
            instance, data=request.data, partial=partial
        )
        serializer.is_valid(raise_exception=True)
        self.perform_update(serializer)
        return Response(self.response_data, status=status.HTTP_200_OK)

    def _handle_relation(
        self, model, request, recipe, already_msg, not_found_msg
    ):
        """
        Универсальный метод для добавления/удаления рецепта
        в промежуточные модели (Favorite, ShoppingCart).

        Аргументы:
            model — модель связи (Favorite/ShoppingCart).
            request — текущий запрос.
            recipe — объект рецепта.
            already_msg — сообщение, если объект уже существует.
            not_found_msg — сообщение, если объект не найден.
        """
        if request.method == 'POST':
            if model.objects.filter(user=request.user, recipe=recipe).exists():
                return Response(
                    {'errors': already_msg}, status=status.HTTP_400_BAD_REQUEST
                )
            model.objects.create(user=request.user, recipe=recipe)
            serializer = ShortRecipeSerializer(
                recipe, context={'request': request}
            )
            return Response(serializer.data, status=status.HTTP_201_CREATED)

        if request.method == 'DELETE':
            obj = model.objects.filter(user=request.user, recipe=recipe)
            if not obj.exists():
                return Response(
                    {'errors': not_found_msg},
                    status=status.HTTP_400_BAD_REQUEST,
                )
            obj.delete()
            return Response(status=status.HTTP_204_NO_CONTENT)

    @action(
        detail=True,
        methods=['post', 'delete'],
        permission_classes=[permissions.IsAuthenticated],
    )
    def favorite(self, request, pk=None):
        """Добавить или удалить рецепт из избранного."""
        recipe = self.get_object()
        return self._handle_relation(
            Favorite,
            request,
            recipe,
            already_msg='Рецепт уже в избранном.',
            not_found_msg='Рецепта нет в избранном.',
        )

    @action(
        detail=True,
        methods=['post', 'delete'],
        permission_classes=[permissions.IsAuthenticated],
    )
    def shopping_cart(self, request, pk=None):
        """Добавить или удалить рецепт из списка покупок."""
        recipe = self.get_object()
        return self._handle_relation(
            ShoppingCart,
            request,
            recipe,
            already_msg='Рецепт уже в списке покупок.',
            not_found_msg='Рецепта нет в списке покупок.',
        )

    @action(
        detail=False,
        methods=['get'],
        permission_classes=[permissions.IsAuthenticated],
    )
    def download_shopping_cart(self, request):
        """Скачать список покупок в виде .txt файла."""
        ingredients = (
            IngredientAmount.objects.filter(
                recipe__shopping_cart__user=request.user
            )
            .values('ingredient__name', 'ingredient__measurement_unit')
            .annotate(total=Sum('amount'))
            .order_by('ingredient__name')
        )
        if not ingredients.exists():
            return Response(
                {'detail': 'Список покупок пуст.'},
                status=status.HTTP_400_BAD_REQUEST,
            )

        lines = [
            f'{item["ingredient__name"]} '
            f'({item["ingredient__measurement_unit"]}) — '
            f'{item["total"]}'
            for item in ingredients
        ]
        content = '\n'.join(lines)
        response = HttpResponse(content, content_type='text/plain')
        response['Content-Disposition'] = (
            'attachment; filename="shopping_list.txt"'
        )
        return response

    @action(detail=True, methods=['get'], url_path='get-link')
    def get_link(self, request, pk=None):
        """Получить короткую ссылку на рецепт."""
        recipe = get_object_or_404(Recipe, pk=pk)
        return Response(
            {'short-link': f'http://{request.get_host()}/s/{recipe.id}/'}
        )


class TagViewSet(viewsets.ReadOnlyModelViewSet):
    """Вьюсет для тегов (только чтение)."""

    queryset = Tag.objects.all()
    serializer_class = TagSerializer
    permission_classes = (permissions.AllowAny,)
    pagination_class = None


class IngredientNameFilter(BaseFilterBackend):
    """Фильтр по начальному совпадению имени ингредиента."""

    def filter_queryset(self, request, queryset, view):
        """
        Возвращает отфильтрованный queryset по параметру name.

        Аргументы:
            request — объект запроса.
            queryset — исходный набор ингредиентов.
            view — текущее представление.

        Возвращает:
            QuerySet с ингредиентами,
            имя которых начинается с переданного параметра.
        """
        name = request.query_params.get('name')
        if name:
            return queryset.filter(name__istartswith=name)
        return queryset


class IngredientViewSet(viewsets.ReadOnlyModelViewSet):
    """Вьюсет для ингредиентов с поиском по названию (только чтение)."""

    queryset = Ingredient.objects.all()
    serializer_class = IngredientSerializer
    permission_classes = (permissions.AllowAny,)
    filter_backends = [IngredientNameFilter]
    pagination_class = None
