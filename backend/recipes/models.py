from django.contrib.auth import get_user_model
from django.core.validators import MinValueValidator
from django.db import models

from recipes.constants import (
    COOKING_TIME_MIN_VALUE,
    INGREDIENT_AMOUNT_MIN_VALUE,
    INGREDIENT_NAME_MAX_LENGTH,
    MEASUREMENT_UNIT_MAX_LENGTH,
    RECIPE_NAME_MAX_LENGTH,
    TAG_NAME_MAX_LENGTH,
    TAG_SLUG_MAX_LENGTH,
)

User = get_user_model()


class Tag(models.Model):
    """Тег для классификации рецептов."""

    name = models.CharField(
        max_length=TAG_NAME_MAX_LENGTH, unique=True, verbose_name='Название'
    )
    slug = models.SlugField(
        max_length=TAG_SLUG_MAX_LENGTH, unique=True, verbose_name='Слаг'
    )

    class Meta:
        verbose_name = 'Тег'
        verbose_name_plural = 'Теги'
        ordering = ['name']

    def __str__(self) -> str:
        """Возвращает название тега."""
        return self.name


class Ingredient(models.Model):
    """Ингредиент с единицей измерения."""

    name = models.CharField(
        max_length=INGREDIENT_NAME_MAX_LENGTH, verbose_name='Название'
    )
    measurement_unit = models.CharField(
        max_length=MEASUREMENT_UNIT_MAX_LENGTH,
        verbose_name='Единица измерения',
    )

    class Meta:
        verbose_name = 'Ингредиент'
        verbose_name_plural = 'Ингредиенты'
        constraints = [
            models.UniqueConstraint(
                fields=['name', 'measurement_unit'], name='unique_ingredient'
            )
        ]
        ordering = ['name']

    def __str__(self) -> str:
        """Возвращает строку вида «Название, единица измерения»."""
        return f'{self.name}, {self.measurement_unit}'


class Recipe(models.Model):
    """Рецепт с автором, ингредиентами, тегами и временем приготовления."""

    author = models.ForeignKey(
        User,
        on_delete=models.CASCADE,
        related_name='recipes',
        verbose_name='Автор',
    )
    name = models.CharField(
        max_length=RECIPE_NAME_MAX_LENGTH, verbose_name='Название'
    )
    image = models.ImageField(
        upload_to='recipes/images/', verbose_name='Картинка'
    )
    text = models.TextField(verbose_name='Описание')
    cooking_time = models.PositiveIntegerField(
        validators=[MinValueValidator(COOKING_TIME_MIN_VALUE)],
        verbose_name='Время приготовления (мин)',
    )
    ingredients = models.ManyToManyField(
        'Ingredient',
        through='IngredientAmount',
        related_name='recipes',
        verbose_name='Ингредиенты',
    )
    tags = models.ManyToManyField(
        'Tag', related_name='recipes', verbose_name='Теги'
    )
    pub_date = models.DateTimeField(
        auto_now_add=True, verbose_name='Дата публикации'
    )

    class Meta:
        ordering = ['-pub_date']
        verbose_name = 'Рецепт'
        verbose_name_plural = 'Рецепты'

    def __str__(self) -> str:
        """Возвращает название рецепта."""
        return self.name


class IngredientAmount(models.Model):
    """Количество конкретного ингредиента в рецепте."""

    recipe = models.ForeignKey(
        Recipe,
        on_delete=models.CASCADE,
        related_name='ingredient_amounts',
        verbose_name='Рецепт',
    )
    ingredient = models.ForeignKey(
        Ingredient,
        on_delete=models.CASCADE,
        related_name='ingredient_amounts',
        verbose_name='Ингредиент',
    )
    amount = models.PositiveIntegerField(
        validators=[MinValueValidator(INGREDIENT_AMOUNT_MIN_VALUE)],
        verbose_name='Количество',
    )

    class Meta:
        verbose_name = 'Ингредиент в рецепте'
        verbose_name_plural = 'Ингредиенты в рецепте'
        constraints = [
            models.UniqueConstraint(
                fields=['recipe', 'ingredient'],
                name='unique_ingredient_in_recipe',
            )
        ]
        ordering = ['ingredient__name']

    def __str__(self) -> str:
        """Возвращает строку вида «Ингредиент — количество»."""
        return f'{self.ingredient} — {self.amount}'


class UserRecipeRelation(models.Model):
    """
    Абстрактная модель связи пользователя и рецепта.

    Используется для избранного и списка покупок.
    """

    user = models.ForeignKey(
        User,
        on_delete=models.CASCADE,
        related_name='%(class)ss',
        verbose_name='Пользователь',
    )
    recipe = models.ForeignKey(
        Recipe,
        on_delete=models.CASCADE,
        related_name='%(class)ss',
        verbose_name='Рецепт',
    )

    class Meta:
        abstract = True

    def __str__(self) -> str:
        """Возвращает строку вида «user → recipe»."""
        return f'{self.user} → {self.recipe}'


class Favorite(UserRecipeRelation):
    """Избранные рецепты пользователя."""

    class Meta:
        verbose_name = 'Избранное'
        verbose_name_plural = 'Избранное'
        constraints = [
            models.UniqueConstraint(
                fields=['user', 'recipe'], name='unique_favorite'
            )
        ]
        ordering = ['user', 'recipe']


class ShoppingCart(UserRecipeRelation):
    """Список покупок пользователя."""

    class Meta:
        verbose_name = 'Список покупок'
        verbose_name_plural = 'Списки покупок'
        constraints = [
            models.UniqueConstraint(
                fields=['user', 'recipe'], name='unique_shopping_cart'
            )
        ]
        ordering = ['user', 'recipe']
