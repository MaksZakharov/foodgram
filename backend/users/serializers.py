from djoser.serializers import UserCreateSerializer, UserSerializer
from rest_framework import serializers
from drf_extra_fields.fields import Base64ImageField
from .models import User  # твоя кастомная модель пользователя


class CustomUserCreateSerializer(UserCreateSerializer):
    """Сериализатор для регистрации пользователей."""

    class Meta(UserCreateSerializer.Meta):
        model = User
        fields = (
            "id",
            "email",
            "username",
            "first_name",
            "last_name",
            "password",
        )
        extra_kwargs = {
            "password": {"write_only": True},
            "first_name": {"required": True},
            "last_name": {"required": True},
        }


class CustomUserSerializer(UserSerializer):
    """Сериализатор для отображения пользователя (ReDoc)."""

    is_subscribed = serializers.SerializerMethodField()
    avatar = Base64ImageField(required=False, allow_null=True)

    class Meta(UserSerializer.Meta):
        model = User
        fields = (
            "id",
            "email",
            "username",
            "first_name",
            "last_name",
            "is_subscribed",
            "avatar",
        )

    def get_is_subscribed(self, obj):
        """Проверка, подписан ли текущий пользователь на obj."""
        request = self.context.get("request")
        if request and request.user.is_authenticated:
            return request.user.follower.filter(author=obj).exists()
        return False
