import django_filters

from api.utils import filter_by_user_relation
from recipes.models import Recipe


class RecipeFilter(django_filters.FilterSet):
    """
    Набор фильтров для рецептов.

    Поддерживает:
    - фильтрацию по тегам (slug),
    - проверку, добавлен ли рецепт в избранное текущего пользователя,
    - проверку, добавлен ли рецепт в список покупок.
    """

    tags = django_filters.AllValuesMultipleFilter(field_name='tags__slug')
    is_favorited = django_filters.NumberFilter(method='filter_is_favorited')
    is_in_shopping_cart = django_filters.NumberFilter(
        method='filter_is_in_shopping_cart'
    )

    class Meta:
        """Метаданные фильтра: модель и доступные поля."""

        model = Recipe
        fields = ('tags', 'author')

    def filter_is_favorited(self, queryset, name, value):
        """
        Фильтрует рецепты по признаку «в избранном».

        Аргументы:
            queryset — исходный набор рецептов (QuerySet).
            name — имя фильтра (не используется напрямую).
            value — значение фильтра (1 — выбрать, 0 — исключить).

        Возвращает:
            Отфильтрованный набор рецептов (QuerySet).
        """
        return filter_by_user_relation(
            queryset, self.request.user, value, 'favorites__user'
        )

    def filter_is_in_shopping_cart(self, queryset, name, value):
        """
        Фильтрует рецепты по признаку «в корзине покупок».

        Аргументы:
            queryset — исходный набор рецептов (QuerySet).
            name — имя фильтра (не используется напрямую).
            value — значение фильтра (1 — выбрать, 0 — исключить).

        Возвращает:
            Отфильтрованный набор рецептов (QuerySet).
        """
        return filter_by_user_relation(
            queryset, self.request.user, value, 'shopping_cart__user'
        )
