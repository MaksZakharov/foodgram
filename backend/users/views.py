from djoser.views import UserViewSet as DjoserUserViewSet
from rest_framework import permissions, status
from rest_framework.decorators import action
from rest_framework.pagination import PageNumberPagination
from rest_framework.response import Response

from .models import Follow, User
from .serializers import (
    CustomUserSerializer,
    ShortRecipeSerializer,  # noqa: F401
    SubscriptionSerializer,  # noqa: F401
)


class LimitPagination(PageNumberPagination):
    page_size_query_param = 'limit'


class UserViewSet(DjoserUserViewSet):
    """Вьюсет пользователей с поддержкой подписок и аватара."""

    queryset = User.objects.all()
    serializer_class = CustomUserSerializer
    lookup_field = 'id'
    lookup_url_kwarg = 'id'

    def get_permissions(self):
        if self.action in ['list', 'retrieve', 'create']:
            return [permissions.AllowAny()]
        return [permissions.IsAuthenticated()]

    @action(
        detail=False,
        methods=['get', 'post', 'put', 'delete'],
        url_path='me/avatar',
        permission_classes=[permissions.IsAuthenticated],
    )
    def avatar(self, request):
        """
        Загрузка, обновление,
        удаление и просмотр аватара текущего пользователя.
        """
        user = request.user

        # Просмотр аватара
        if request.method == 'GET':
            if not user.avatar:
                return Response(
                    {'error': 'Аватар не установлен'},
                    status=status.HTTP_404_NOT_FOUND,
                )
            return Response(
                {'avatar': user.avatar.url}, status=status.HTTP_200_OK
            )

        # Создание/обновление аватара
        if request.method in ['POST', 'PUT']:
            if not request.data.get('avatar'):
                return Response(
                    {'error': 'Аватар не передан'},
                    status=status.HTTP_400_BAD_REQUEST,
                )

            serializer = CustomUserSerializer(
                user,
                data=request.data,
                partial=True,
                context={'request': request},
            )
            serializer.is_valid(raise_exception=True)
            serializer.save()

            # ⚡️ Чтобы пройти тесты Postman — возвращаем только avatar
            return Response(
                {'avatar': user.avatar.url}, status=status.HTTP_200_OK
            )

        # Удаление аватара
        if request.method == 'DELETE':
            if user.avatar:
                user.avatar.delete(save=True)
            return Response(status=status.HTTP_204_NO_CONTENT)

        return Response(status=status.HTTP_405_METHOD_NOT_ALLOWED)

    @action(
        detail=True,
        methods=['post', 'delete'],
        permission_classes=[permissions.IsAuthenticated],
    )
    def subscribe(self, request, id=None):
        """Подписаться или отписаться от пользователя."""
        author = self.get_object()

        if request.method == 'POST':
            if request.user == author:
                return Response(
                    {'errors': 'Нельзя подписаться на самого себя.'},
                    status=status.HTTP_400_BAD_REQUEST,
                )
            if Follow.objects.filter(
                user=request.user, author=author
            ).exists():
                return Response(
                    {'errors': 'Вы уже подписаны на этого автора.'},
                    status=status.HTTP_400_BAD_REQUEST,
                )
            Follow.objects.create(user=request.user, author=author)
            serializer = SubscriptionSerializer(
                author, context={'request': request}
            )
            return Response(serializer.data, status=status.HTTP_201_CREATED)

        if request.method == 'DELETE':
            subscription = Follow.objects.filter(
                user=request.user, author=author
            )
            if not subscription.exists():
                return Response(
                    {'errors': 'Вы не подписаны на этого пользователя.'},
                    status=status.HTTP_400_BAD_REQUEST,
                )
            subscription.delete()
            return Response(status=status.HTTP_204_NO_CONTENT)

    @action(
        detail=False,
        methods=['get'],
        permission_classes=[permissions.IsAuthenticated],
    )
    def subscriptions(self, request):
        """Список авторов, на которых подписан текущий пользователь."""
        authors = User.objects.filter(following__user=request.user)
        paginator = LimitPagination()
        page = paginator.paginate_queryset(authors, request)
        serializer = SubscriptionSerializer(
            page, many=True, context={'request': request}
        )
        return paginator.get_paginated_response(serializer.data)
