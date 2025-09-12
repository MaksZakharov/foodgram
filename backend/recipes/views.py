from django.db.models import Sum
from django.http import HttpResponse
from rest_framework import viewsets, permissions, status
from rest_framework.decorators import action
from rest_framework.response import Response
from django_filters.rest_framework import DjangoFilterBackend
from rest_framework.filters import BaseFilterBackend
from django.shortcuts import get_object_or_404
from api.permissions import IsAuthorOrReadOnly


from .models import Recipe, Ingredient, Tag, Favorite, ShoppingCart, IngredientAmount
from .serializers import (
    RecipeReadSerializer,
    RecipeWriteSerializer,
    TagSerializer,
    IngredientSerializer,
)
from api.filters import RecipeFilter
from .short_serializers import ShortRecipeSerializer


class RecipeViewSet(viewsets.ModelViewSet):
    """Вьюсет для рецептов: CRUD, избранное, корзина, фильтры."""

    queryset = Recipe.objects.all()
    permission_classes = (IsAuthorOrReadOnly,)

    def get_serializer_class(self):
        if self.request.method in ("POST", "PATCH", "PUT"):
            return RecipeWriteSerializer
        return RecipeReadSerializer

    def perform_create(self, serializer):
        recipe = serializer.save(author=self.request.user)
        read_serializer = RecipeReadSerializer(
            recipe, context={"request": self.request}
        )
        self.response_data = read_serializer.data

    def perform_update(self, serializer):
        recipe = serializer.save()
        read_serializer = RecipeReadSerializer(
            recipe, context={"request": self.request}
        )
        self.response_data = read_serializer.data

    def create(self, request, *args, **kwargs):
        serializer = self.get_serializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        self.perform_create(serializer)
        return Response(self.response_data, status=status.HTTP_201_CREATED)

    def update(self, request, *args, **kwargs):
        partial = kwargs.pop("partial", False)
        instance = self.get_object()
        serializer = self.get_serializer(instance, data=request.data, partial=partial)
        serializer.is_valid(raise_exception=True)
        self.perform_update(serializer)
        return Response(self.response_data, status=status.HTTP_200_OK)

    filter_backends = [DjangoFilterBackend]
    filterset_class = RecipeFilter

    @action(
        detail=True,
        methods=["post", "delete"],
        permission_classes=[permissions.IsAuthenticated],
    )
    def favorite(self, request, pk=None):
        """Добавить или удалить рецепт из избранного."""
        recipe = self.get_object()

        if request.method == "POST":
            if Favorite.objects.filter(user=request.user, recipe=recipe).exists():
                return Response(
                    {"errors": "Рецепт уже в избранном."},
                    status=status.HTTP_400_BAD_REQUEST,
                )
            Favorite.objects.create(user=request.user, recipe=recipe)
            serializer = ShortRecipeSerializer(recipe, context={"request": request})
            return Response(serializer.data, status=status.HTTP_201_CREATED)

        if request.method == "DELETE":
            fav_item = Favorite.objects.filter(user=request.user, recipe=recipe)
            if not fav_item.exists():
                return Response(
                    {"errors": "Рецепта нет в избранном."},
                    status=status.HTTP_400_BAD_REQUEST,
                )
            fav_item.delete()
            return Response(status=status.HTTP_204_NO_CONTENT)

    @action(
        detail=True,
        methods=["post", "delete"],
        permission_classes=[permissions.IsAuthenticated],
    )
    def shopping_cart(self, request, pk=None):
        """Добавить или удалить рецепт из списка покупок."""
        recipe = self.get_object()

        if request.method == "POST":
            if ShoppingCart.objects.filter(user=request.user, recipe=recipe).exists():
                return Response(
                    {"errors": "Рецепт уже в списке покупок."},
                    status=status.HTTP_400_BAD_REQUEST,
                )
            ShoppingCart.objects.create(user=request.user, recipe=recipe)
            serializer = ShortRecipeSerializer(recipe, context={"request": request})
            return Response(serializer.data, status=status.HTTP_201_CREATED)

        if request.method == "DELETE":
            cart_item = ShoppingCart.objects.filter(user=request.user, recipe=recipe)
            if not cart_item.exists():
                return Response(
                    {"errors": "Рецепта нет в списке покупок."},
                    status=status.HTTP_400_BAD_REQUEST,
                )
            cart_item.delete()
            return Response(status=status.HTTP_204_NO_CONTENT)

    @action(
        detail=False,
        methods=["get"],
        permission_classes=[permissions.IsAuthenticated],
    )
    def download_shopping_cart(self, request):
        """Скачать список покупок в txt."""
        ingredients = (
            IngredientAmount.objects.filter(recipe__shopping_cart__user=request.user)
            .values("ingredient__name", "ingredient__measurement_unit")
            .annotate(total=Sum("amount"))
            .order_by("ingredient__name")
        )
        if not ingredients.exists():
            return Response(
                {"detail": "Список покупок пуст."},
                status=status.HTTP_400_BAD_REQUEST,
            )

        lines = [
            f"{item['ingredient__name']} ({item['ingredient__measurement_unit']}) — {item['total']}"
            for item in ingredients
        ]
        content = "\n".join(lines)
        response = HttpResponse(content, content_type="text/plain")
        response["Content-Disposition"] = 'attachment; filename="shopping_list.txt"'
        return response

    @action(detail=True, methods=["get"], url_path="get-link")
    def get_link(self, request, pk=None):
        """Получить короткую ссылку на рецепт."""
        recipe = get_object_or_404(Recipe, pk=pk)
        return Response({"short-link": f"http://{request.get_host()}/s/{recipe.id}/"})


class TagViewSet(viewsets.ReadOnlyModelViewSet):
    """Вьюсет для тегов."""

    queryset = Tag.objects.all()
    serializer_class = TagSerializer
    permission_classes = (permissions.AllowAny,)
    pagination_class = None


class IngredientNameFilter(BaseFilterBackend):
    """Фильтр по начальному совпадению имени ингредиента."""

    def filter_queryset(self, request, queryset, view):
        name = request.query_params.get("name")
        if name:
            return queryset.filter(name__istartswith=name)
        return queryset


class IngredientViewSet(viewsets.ReadOnlyModelViewSet):
    """Вьюсет для ингредиентов с поиском по названию."""

    queryset = Ingredient.objects.all()
    serializer_class = IngredientSerializer
    permission_classes = (permissions.AllowAny,)
    filter_backends = [IngredientNameFilter]
    pagination_class = None
