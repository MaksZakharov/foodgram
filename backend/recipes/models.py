from django.conf import settings
from django.core.validators import MinValueValidator
from django.db import models


class Tag(models.Model):
    """Модель тега для классификации рецептов."""

    name = models.CharField(max_length=200, unique=True, verbose_name="Название")
    color = models.CharField(max_length=7, unique=True, verbose_name="Цвет (HEX)")
    slug = models.SlugField(max_length=200, unique=True, verbose_name="Слаг")

    class Meta:
        verbose_name = "Тег"
        verbose_name_plural = "Теги"

    def __str__(self) -> str:
        """Возвращает название тега в виде строки."""
        return self.name


class Ingredient(models.Model):
    """Модель ингредиента (название и единица измерения)."""

    name = models.CharField(max_length=200, verbose_name="Название")
    measurement_unit = models.CharField(
        max_length=200, verbose_name="Единица измерения"
    )

    class Meta:
        verbose_name = "Ингредиент"
        verbose_name_plural = "Ингредиенты"
        constraints = [
            models.UniqueConstraint(
                fields=["name", "measurement_unit"], name="unique_ingredient"
            )
        ]

    def __str__(self) -> str:
        """Возвращает название и единицу измерения в строке."""
        return f"{self.name}, {self.measurement_unit}"


class Recipe(models.Model):
    """Модель рецепта с автором, тегами и ингредиентами."""

    author = models.ForeignKey(
        settings.AUTH_USER_MODEL,
        on_delete=models.CASCADE,
        related_name="recipes",
        verbose_name="Автор",
    )
    name = models.CharField(max_length=200, verbose_name="Название")
    image = models.ImageField(upload_to="recipes/images/", verbose_name="Картинка")
    text = models.TextField(verbose_name="Описание")
    cooking_time = models.PositiveIntegerField(
        validators=[MinValueValidator(1)], verbose_name="Время приготовления (мин)"
    )
    ingredients = models.ManyToManyField(
        "Ingredient",
        through="IngredientAmount",
        related_name="recipes",
        verbose_name="Ингредиенты",
    )
    tags = models.ManyToManyField("Tag", related_name="recipes", verbose_name="Теги")
    pub_date = models.DateTimeField(auto_now_add=True, verbose_name="Дата публикации")

    class Meta:
        ordering = ["-pub_date"]
        verbose_name = "Рецепт"
        verbose_name_plural = "Рецепты"

    def __str__(self) -> str:
        """Возвращает название рецепта в виде строки."""
        return self.name


class IngredientAmount(models.Model):
    """Модель количества ингредиента в конкретном рецепте."""

    recipe = models.ForeignKey(
        Recipe, on_delete=models.CASCADE, related_name="ingredient_amounts"
    )
    ingredient = models.ForeignKey(
        Ingredient, on_delete=models.CASCADE, related_name="ingredient_amounts"
    )
    amount = models.PositiveIntegerField(
        validators=[MinValueValidator(1)], verbose_name="Количество"
    )

    class Meta:
        verbose_name = "Ингредиент в рецепте"
        verbose_name_plural = "Ингредиенты в рецепте"
        constraints = [
            models.UniqueConstraint(
                fields=["recipe", "ingredient"], name="unique_ingredient_in_recipe"
            )
        ]

    def __str__(self) -> str:
        """Возвращает строку с ингредиентом и его количеством."""
        return f"{self.ingredient} — {self.amount}"


class Favorite(models.Model):
    """Модель для хранения избранных рецептов пользователя."""

    user = models.ForeignKey(
        settings.AUTH_USER_MODEL, on_delete=models.CASCADE, related_name="favorites"
    )
    recipe = models.ForeignKey(
        Recipe, on_delete=models.CASCADE, related_name="favorites"
    )

    class Meta:
        verbose_name = "Избранное"
        verbose_name_plural = "Избранное"
        constraints = [
            models.UniqueConstraint(fields=["user", "recipe"], name="unique_favorite")
        ]

    def __str__(self) -> str:
        """Возвращает строку: какой пользователь добавил какой рецепт."""
        return f"{self.user} → {self.recipe}"


class ShoppingCart(models.Model):
    """Модель списка покупок пользователя."""

    user = models.ForeignKey(
        settings.AUTH_USER_MODEL, on_delete=models.CASCADE, related_name="shopping_cart"
    )
    recipe = models.ForeignKey(
        Recipe, on_delete=models.CASCADE, related_name="shopping_cart"
    )

    class Meta:
        verbose_name = "Список покупок"
        verbose_name_plural = "Списки покупок"
        constraints = [
            models.UniqueConstraint(
                fields=["user", "recipe"], name="unique_shopping_cart"
            )
        ]

    def __str__(self) -> str:
        """Возвращает строку: какой пользователь добавил какой рецепт в корзину."""
        return f"{self.user} → {self.recipe}"
