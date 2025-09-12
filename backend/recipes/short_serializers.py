from rest_framework import serializers
from .models import Recipe


class ShortRecipeSerializer(serializers.ModelSerializer):
    """Короткий сериализатор для рецепта (ReDoc)."""

    image = serializers.SerializerMethodField()

    def get_image(self, obj):
        request = self.context.get("request")
        if obj.image and hasattr(obj.image, "url"):
            return request.build_absolute_uri(obj.image.url)
        return ""

    class Meta:
        model = Recipe
        fields = ("id", "name", "image", "cooking_time")
