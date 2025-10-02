from rest_framework import serializers

from recipes.models import Recipe


class ShortRecipeSerializer(serializers.ModelSerializer):
    """Короткий сериализатор для рецепта (ReDoc)."""

    image = serializers.ImageField()

    class Meta:
        model = Recipe
        fields = ('id', 'name', 'image', 'cooking_time')
