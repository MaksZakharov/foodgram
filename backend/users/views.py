from djoser.views import UserViewSet as DjoserUserViewSet
from rest_framework import permissions, status
from rest_framework.decorators import action
from rest_framework.response import Response

from .models import User, Follow
from .serializers import CustomUserSerializer


class UserViewSet(DjoserUserViewSet):
    """Вьюсет пользователей с поддержкой подписок."""

    queryset = User.objects.all()
    serializer_class = CustomUserSerializer
    permission_classes = (permissions.IsAuthenticatedOrReadOnly,)

    @action(
        detail=True,
        methods=["post", "delete"],
        permission_classes=[permissions.IsAuthenticated],
    )
    def subscribe(self, request, id=None):
        """Подписаться или отписаться от пользователя."""
        author = self.get_object()

        if request.method == "POST":
            if request.user == author:
                return Response(
                    {"errors": "Нельзя подписаться на самого себя."},
                    status=status.HTTP_400_BAD_REQUEST,
                )
            Follow.objects.get_or_create(user=request.user, author=author)
            serializer = CustomUserSerializer(author, context={"request": request})
            return Response(serializer.data, status=status.HTTP_201_CREATED)

        if request.method == "DELETE":
            Follow.objects.filter(user=request.user, author=author).delete()
            return Response(status=status.HTTP_204_NO_CONTENT)

    @action(
        detail=False, methods=["get"], permission_classes=[permissions.IsAuthenticated]
    )
    def subscriptions(self, request):
        """Список авторов, на которых подписан текущий пользователь."""
        authors = User.objects.filter(following__user=request.user)
        serializer = CustomUserSerializer(
            authors, many=True, context={"request": request}
        )
        return Response(serializer.data, status=status.HTTP_200_OK)
