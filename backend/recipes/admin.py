from django.contrib import admin
from recipes.models import (
    Tag,
    Ingredient,
    Recipe,
    IngredientAmount,
    Favorite,
    ShoppingCart,
)


@admin.register(Tag)
class TagAdmin(admin.ModelAdmin):
    """Админка для модели Tag."""

    list_display = ("id", "name", "color", "slug")
    search_fields = ("name", "slug")
    ordering = ("name",)


@admin.register(Ingredient)
class IngredientAdmin(admin.ModelAdmin):
    """Админка для модели Ingredient."""

    list_display = ("id", "name", "measurement_unit")
    search_fields = ("name",)
    ordering = ("name",)


class IngredientAmountInline(admin.TabularInline):
    """Инлайн-редактор ингредиентов внутри рецепта."""

    model = IngredientAmount
    extra = 1
    autocomplete_fields = ("ingredient",)


@admin.register(Recipe)
class RecipeAdmin(admin.ModelAdmin):
    """Админка для модели Recipe."""

    list_display = (
        "id",
        "name",
        "author",
        "cooking_time",
        "pub_date",
        "favorites_count",
    )
    search_fields = ("name", "author__username", "author__email")
    list_filter = ("tags",)
    ordering = ("-pub_date",)
    inlines = (IngredientAmountInline,)

    def favorites_count(self, obj):
        """Количество добавлений рецепта в избранное."""
        return obj.favorites.count()

    favorites_count.short_description = "В избранном"


@admin.register(Favorite)
class FavoriteAdmin(admin.ModelAdmin):
    """Админка для модели Favorite."""

    list_display = ("id", "user", "recipe")
    search_fields = ("user__email", "recipe__name")


@admin.register(ShoppingCart)
class ShoppingCartAdmin(admin.ModelAdmin):
    """Админка для модели ShoppingCart."""

    list_display = ("id", "user", "recipe")
    search_fields = ("user__email", "recipe__name")
