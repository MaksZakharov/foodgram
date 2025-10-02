from djoser.views import UserViewSet as DjoserUserViewSet
from rest_framework import permissions, status
from rest_framework.decorators import action
from rest_framework.permissions import IsAuthenticatedOrReadOnly
from rest_framework.response import Response

from api.pagination import LimitPageNumberPagination
from api.serializers.users import SubscriptionSerializer, UserSerializer
from users.models import Follow, User


class UserViewSet(DjoserUserViewSet):
    """
    Вьюсет для пользователей.

    Расширяет базовый UserViewSet:
    - управление аватаром;
    - подписки (подписаться/отписаться);
    - список подписок.
    """

    queryset = User.objects.all()
    serializer_class = UserSerializer
    lookup_field = 'id'
    lookup_url_kwarg = 'id'
    permission_classes = (IsAuthenticatedOrReadOnly,)

    @action(
        detail=False,
        methods=['get', 'post', 'delete'],
        url_path='me/avatar',
        permission_classes=[permissions.IsAuthenticated],
    )
    def avatar(self, request):
        """
        Загрузка, обновление, удаление
        и просмотр аватара текущего пользователя.

        GET → вернуть ссылку на аватар.
        POST → загрузить или обновить.
        DELETE → удалить аватар.
        """
        user = request.user

        if request.method == 'GET':
            return Response(
                {'avatar': user.avatar.url if user.avatar else None},
                status=status.HTTP_200_OK,
            )

        if request.method == 'POST':
            if not request.data.get('avatar'):
                return Response(
                    {'error': 'Аватар не передан'},
                    status=status.HTTP_400_BAD_REQUEST,
                )

            serializer = UserSerializer(
                user,
                data=request.data,
                partial=True,
                context={'request': request},
            )
            serializer.is_valid(raise_exception=True)
            serializer.save()

            return Response(
                {'avatar': user.avatar.url},
                status=status.HTTP_200_OK,
            )

        if user.avatar:
            user.avatar.delete(save=True)
        return Response(status=status.HTTP_204_NO_CONTENT)

    def _handle_subscription(self, request, author):
        """
        Универсальный метод для подписки/отписки на автора.

        Аргументы:
            request — текущий запрос.
            author — пользователь, на которого подписываются.
        """
        if request.method == 'POST':
            if request.user == author:
                return Response(
                    {'errors': 'Нельзя подписаться на самого себя.'},
                    status=status.HTTP_400_BAD_REQUEST,
                )
            if Follow.objects.filter(
                user=request.user,
                author=author,
            ).exists():
                return Response(
                    {'errors': 'Вы уже подписаны на этого автора.'},
                    status=status.HTTP_400_BAD_REQUEST,
                )
            Follow.objects.create(user=request.user, author=author)
            serializer = SubscriptionSerializer(
                author,
                context={'request': request},
            )
            return Response(serializer.data, status=status.HTTP_201_CREATED)

        deleted_count, _ = Follow.objects.filter(
            user=request.user, author=author
        ).delete()

        if deleted_count == 0:
            return Response(
                {'errors': 'Вы не подписаны на этого пользователя.'},
                status=status.HTTP_400_BAD_REQUEST,
            )
        return Response(status=status.HTTP_204_NO_CONTENT)

    @action(
        detail=True,
        methods=['post', 'delete'],
        permission_classes=[permissions.IsAuthenticated],
    )
    def subscribe(self, request, id=None):
        """Подписаться или отписаться от пользователя."""
        author = self.get_object()
        return self._handle_subscription(request, author)

    @action(
        detail=False,
        methods=['get'],
        permission_classes=[permissions.IsAuthenticated],
    )
    def subscriptions(self, request):
        """Список авторов, на которых подписан текущий пользователь."""
        authors = User.objects.filter(following__user=request.user)
        paginator = LimitPageNumberPagination()
        page = paginator.paginate_queryset(authors, request)
        serializer = SubscriptionSerializer(
            page, many=True, context={'request': request}
        )
        return paginator.get_paginated_response(serializer.data)
