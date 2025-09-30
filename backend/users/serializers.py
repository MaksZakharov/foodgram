from djoser.serializers import UserCreateSerializer, UserSerializer
from drf_extra_fields.fields import Base64ImageField
from rest_framework import serializers

from recipes.short_serializers import ShortRecipeSerializer

from .models import User


class CustomUserCreateSerializer(UserCreateSerializer):
    """Сериализатор для регистрации пользователей."""

    class Meta(UserCreateSerializer.Meta):
        model = User
        fields = (
            'id',
            'email',
            'username',
            'first_name',
            'last_name',
            'password',
        )
        extra_kwargs = {
            'password': {'write_only': True},
            'first_name': {'required': True},
            'last_name': {'required': True},
        }


class CustomUserSerializer(UserSerializer):
    """Сериализатор для отображения информации о пользователе."""

    is_subscribed = serializers.SerializerMethodField()
    avatar = Base64ImageField(required=False, allow_null=True)

    class Meta(UserSerializer.Meta):
        model = User
        fields = (
            'id',
            'email',
            'username',
            'first_name',
            'last_name',
            'is_subscribed',
            'avatar',
        )

    @staticmethod
    def _check_subscription(request, obj):
        """
        Проверяет, подписан ли текущий пользователь на указанного пользователя.

        Аргументы:
            request — объект запроса.
            obj — пользователь (автор).

        Возвращает:
            True, если подписан, иначе False.
        """
        return (
            request
            and hasattr(request, 'user')
            and request.user.is_authenticated
            and request.user.follower.filter(author=obj).exists()
        )

    def get_is_subscribed(self, obj):
        """Определяет, подписан ли текущий пользователь на obj."""
        request = self.context.get('request')
        return self._check_subscription(request, obj)


class SubscriptionSerializer(serializers.ModelSerializer):
    """Сериализатор для отображения подписки с рецептами автора."""

    is_subscribed = serializers.SerializerMethodField()
    avatar = Base64ImageField(required=False, allow_null=True)
    recipes = serializers.SerializerMethodField()
    recipes_count = serializers.SerializerMethodField()

    class Meta:
        model = User
        fields = (
            'id',
            'email',
            'username',
            'first_name',
            'last_name',
            'is_subscribed',
            'avatar',
            'recipes',
            'recipes_count',
        )

    def get_is_subscribed(self, obj):
        """Определяет, подписан ли текущий пользователь на obj."""
        request = self.context.get('request')
        return CustomUserSerializer._check_subscription(request, obj)

    def get_recipes(self, obj):
        """
        Возвращает список рецептов автора.

        Поддерживает query-параметр `recipes_limit` для ограничения количества.
        """
        request = self.context.get('request')
        recipes_limit = request.query_params.get('recipes_limit')
        recipes = obj.recipes.all()
        if recipes_limit and recipes_limit.isdigit():
            recipes = recipes[: int(recipes_limit)]
        return ShortRecipeSerializer(
            recipes, many=True, context=self.context
        ).data

    def get_recipes_count(self, obj):
        """Возвращает количество рецептов у автора."""
        return obj.recipes.count()
