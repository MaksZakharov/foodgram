from drf_extra_fields.fields import Base64ImageField
from rest_framework import serializers

from api.serializers.users import UserSerializer
from recipes.models import Ingredient, IngredientAmount, Recipe, Tag


class TagSerializer(serializers.ModelSerializer):
    """Сериализатор для тегов."""

    class Meta:
        model = Tag
        fields = ('id', 'name', 'slug')


class IngredientSerializer(serializers.ModelSerializer):
    """Сериализатор для ингредиентов."""

    class Meta:
        model = Ingredient
        fields = ('id', 'name', 'measurement_unit')


class IngredientAmountReadSerializer(serializers.ModelSerializer):
    """Сериализатор для отображения ингредиентов в составе рецепта."""

    id = serializers.ReadOnlyField(source='ingredient.id')
    name = serializers.ReadOnlyField(source='ingredient.name')
    measurement_unit = serializers.ReadOnlyField(
        source='ingredient.measurement_unit'
    )

    class Meta:
        model = IngredientAmount
        fields = ('id', 'name', 'measurement_unit', 'amount')


class IngredientAmountWriteSerializer(serializers.ModelSerializer):
    """Сериализатор для добавления ингредиентов в рецепт."""

    id = serializers.PrimaryKeyRelatedField(
        queryset=Ingredient.objects.all(), source='ingredient', write_only=True
    )

    class Meta:
        model = IngredientAmount
        fields = ('id', 'amount')


class RecipeReadSerializer(serializers.ModelSerializer):
    """Сериализатор для чтения рецептов."""

    author = UserSerializer(read_only=True)
    tags = TagSerializer(many=True, read_only=True)
    ingredients = IngredientAmountReadSerializer(
        many=True, source='ingredient_amounts', read_only=True
    )
    image = serializers.ImageField(read_only=True)
    is_favorited = serializers.SerializerMethodField()
    is_in_shopping_cart = serializers.SerializerMethodField()

    class Meta:
        model = Recipe
        fields = (
            'id',
            'author',
            'name',
            'image',
            'text',
            'cooking_time',
            'tags',
            'ingredients',
            'is_favorited',
            'is_in_shopping_cart',
        )

    def _is_related(self, obj, related_field):
        """
        Проверяет наличие связи рецепта с пользователем.

        Аргументы:
            obj — объект рецепта.
            related_field — имя связанного поля (favorites/shopping_cart).

        Возвращает:
            True, если текущий пользователь
            связан с объектом через указанное поле.
        """
        request = self.context.get('request')
        return (
            request
            and hasattr(request, 'user')
            and request.user.is_authenticated
            and manager.filter(user=request.user).exists()
        )

    def get_is_favorited(self, obj):
        """Проверяет, добавлен ли рецепт в избранное текущего пользователя."""
        return self._is_related(obj, obj.favorites)

    def get_is_in_shopping_cart(self, obj):
        """Проверяет, добавлен ли рецепт в корзину текущего пользователя."""
        return self._is_related(obj, obj.shoppingcarts)


class RecipeWriteSerializer(serializers.ModelSerializer):
    """Сериализатор для создания и обновления рецептов."""

    ingredients = IngredientAmountWriteSerializer(many=True, write_only=True)
    tags = serializers.PrimaryKeyRelatedField(
        queryset=Tag.objects.all(),
        many=True,
        write_only=True,
    )
    image = Base64ImageField()

    class Meta:
        model = Recipe
        fields = (
            'id',
            'name',
            'image',
            'text',
            'cooking_time',
            'tags',
            'ingredients',
        )

    def _set_ingredients(self, recipe, ingredients_data):
        """
        Устанавливает ингредиенты для рецепта.

        Аргументы:
            recipe — объект рецепта.
            ingredients_data — список словарей с ингредиентами и количеством.
        """
        for ing in ingredients_data:
            IngredientAmount.objects.create(
                recipe=recipe,
                ingredient=ing['ingredient'],
                amount=ing['amount'],
            )

    def create(self, validated_data):
        """Создаёт рецепт с автором, тегами и ингредиентами."""
        validated_data['author'] = self.context['request'].user
        ingredients_data = validated_data.pop('ingredients')
        tags = validated_data.pop('tags')
        recipe = Recipe.objects.create(**validated_data)
        recipe.tags.set(tags)
        self._set_ingredients(recipe, ingredients_data)
        return recipe

    def update(self, instance, validated_data):
        """Обновляет рецепт, его теги и ингредиенты."""
        ingredients_data = validated_data.pop('ingredients')
        tags = validated_data.pop('tags')
        instance = super().update(instance, validated_data)
        instance.tags.set(tags)
        instance.ingredient_amounts.all().delete()
        self._set_ingredients(instance, ingredients_data)
        return instance

    def validate(self, data):
        """
        Валидирует данные рецепта.

        Проверки:
        - должен быть хотя бы один ингредиент;
        - ингредиенты не должны повторяться;
        - должен быть хотя бы один тег;
        - теги не должны повторяться.
        """
        ingredients = data.get('ingredients')
        if not ingredients:
            raise serializers.ValidationError(
                {'ingredients': 'Нужно добавить хотя бы один ингредиент'}
            )

        ingredient_ids = [item['ingredient'].id for item in ingredients]
        if len(ingredient_ids) != len(set(ingredient_ids)):
            raise serializers.ValidationError(
                {'ingredients': 'Ингредиенты не должны повторяться'}
            )

        tags = data.get('tags')
        if not tags:
            raise serializers.ValidationError(
                {'tags': 'Нужно выбрать хотя бы один тег'}
            )

        if len(tags) != len(set(tags)):
            raise serializers.ValidationError(
                {'tags': 'Теги не должны повторяться'}
            )

        return data

    def validate_image(self, value):
        """Проверяет, что изображение не пустое."""
        if not value:
            raise serializers.ValidationError(
                'Поле image обязательно для заполнения'
            )
        return value
