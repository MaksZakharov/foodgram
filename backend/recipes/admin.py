from django.contrib import admin
from recipes.models import (Favorite, Ingredient, IngredientAmount, Recipe,
                            ShoppingCart, Tag)


class NamedModelAdmin(admin.ModelAdmin):
    """Базовый админ для моделей с названием (name)."""

    ordering = ('name',)
    search_fields = ('name',)


@admin.register(Tag)
class TagAdmin(NamedModelAdmin):
    """Админка для модели Tag."""

    list_display = ('id', 'name', 'color', 'slug')
    search_fields = ('name', 'slug')


@admin.register(Ingredient)
class IngredientAdmin(NamedModelAdmin):
    """Админка для модели Ingredient."""

    list_display = ('id', 'name', 'measurement_unit')


class IngredientAmountInline(admin.TabularInline):
    """Инлайн-редактор ингредиентов внутри рецепта."""

    model = IngredientAmount
    extra = 1
    autocomplete_fields = ('ingredient',)


@admin.register(Recipe)
class RecipeAdmin(admin.ModelAdmin):
    """Админка для модели Recipe."""

    list_display = (
        'id',
        'name',
        'author',
        'cooking_time',
        'pub_date',
        'favorites_count',
    )
    search_fields = ('name', 'author__username', 'author__email')
    list_filter = ('tags',)
    ordering = ('-pub_date',)
    inlines = (IngredientAmountInline,)

    def favorites_count(self, obj):
        """Количество добавлений рецепта в избранное."""
        return obj.favorites.count()

    favorites_count.short_description = 'В избранном'


class UserRecipeAdmin(admin.ModelAdmin):
    """Базовый админ для моделей с пользователем и рецептом."""

    list_display = ('id', 'user', 'recipe')
    search_fields = ('user__email', 'recipe__name')


@admin.register(Favorite)
class FavoriteAdmin(UserRecipeAdmin):
    """Админка для модели Favorite."""


@admin.register(ShoppingCart)
class ShoppingCartAdmin(UserRecipeAdmin):
    """Админка для модели ShoppingCart."""
