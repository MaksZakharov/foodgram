from rest_framework import serializers
from drf_extra_fields.fields import Base64ImageField

from .models import Recipe, Tag, Ingredient, IngredientAmount
from users.serializers import CustomUserSerializer


class TagSerializer(serializers.ModelSerializer):
    class Meta:
        model = Tag
        fields = ("id", "name", "slug")


class IngredientSerializer(serializers.ModelSerializer):
    """Сериализатор для ингредиентов."""

    class Meta:
        model = Ingredient
        fields = ("id", "name", "measurement_unit")


class IngredientAmountReadSerializer(serializers.ModelSerializer):
    """Для отображения ингредиентов в рецепте."""

    id = serializers.ReadOnlyField(source="ingredient.id")
    name = serializers.ReadOnlyField(source="ingredient.name")
    measurement_unit = serializers.ReadOnlyField(source="ingredient.measurement_unit")

    class Meta:
        model = IngredientAmount
        fields = ("id", "name", "measurement_unit", "amount")


class IngredientAmountWriteSerializer(serializers.ModelSerializer):
    """Для записи ингредиентов в рецепт."""

    id = serializers.PrimaryKeyRelatedField(
        queryset=Ingredient.objects.all(), source="ingredient", write_only=True
    )

    class Meta:
        model = IngredientAmount
        fields = ("id", "amount")


class RecipeReadSerializer(serializers.ModelSerializer):
    author = CustomUserSerializer(read_only=True)
    tags = TagSerializer(many=True, read_only=True)
    ingredients = IngredientAmountReadSerializer(
        many=True, source="ingredient_amounts", read_only=True
    )
    image = serializers.SerializerMethodField()
    is_favorited = serializers.SerializerMethodField()
    is_in_shopping_cart = serializers.SerializerMethodField()

    def get_is_favorited(self, obj):
        request = self.context.get("request")
        return (
            request.user.is_authenticated
            and obj.favorites.filter(user=request.user).exists()
        )

    def get_is_in_shopping_cart(self, obj):
        request = self.context.get("request")
        return (
            request.user.is_authenticated
            and obj.shopping_cart.filter(user=request.user).exists()
        )

    def get_image(self, obj):
        request = self.context.get("request")
        if obj.image and hasattr(obj.image, "url"):
            return request.build_absolute_uri(obj.image.url)
        return ""

    class Meta:
        model = Recipe
        fields = (
            "id",
            "author",
            "name",
            "image",
            "text",
            "cooking_time",
            "tags",
            "ingredients",
            "is_favorited",
            "is_in_shopping_cart",
        )


class RecipeWriteSerializer(serializers.ModelSerializer):
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
            "id",
            "name",
            "image",
            "text",
            "cooking_time",
            "tags",
            "ingredients",
        )

    def create(self, validated_data):
        ingredients_data = validated_data.pop("ingredients")
        tags = validated_data.pop("tags")
        recipe = Recipe.objects.create(**validated_data)  # ⚡ author убираем
        recipe.tags.set(tags)
        for ing in ingredients_data:
            IngredientAmount.objects.create(
                recipe=recipe, ingredient=ing["ingredient"], amount=ing["amount"]
            )
        return recipe

    def update(self, instance, validated_data):
        ingredients_data = validated_data.pop("ingredients")
        tags = validated_data.pop("tags")
        instance = super().update(instance, validated_data)
        instance.tags.set(tags)
        instance.ingredient_amounts.all().delete()
        for ing in ingredients_data:
            IngredientAmount.objects.create(
                recipe=instance, ingredient=ing["ingredient"], amount=ing["amount"]
            )
        return instance

    def validate(self, data):
        ingredients = data.get("ingredients")
        if not ingredients:
            raise serializers.ValidationError(
                {"ingredients": "Нужно добавить хотя бы один ингредиент"}
            )

        ingredient_ids = [item["ingredient"].id for item in ingredients]
        if len(ingredient_ids) != len(set(ingredient_ids)):
            raise serializers.ValidationError(
                {"ingredients": "Ингредиенты не должны повторяться"}
            )

        tags = data.get("tags")
        if not tags:
            raise serializers.ValidationError(
                {"tags": "Нужно выбрать хотя бы один тег"}
            )

        if len(tags) != len(set(tags)):
            raise serializers.ValidationError({"tags": "Теги не должны повторяться"})

        return data

    def validate_image(self, value):
        if not value:
            raise serializers.ValidationError("Поле image обязательно для заполнения")
        return value
