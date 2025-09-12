import django_filters

from api.utils import filter_by_user_relation
from recipes.models import Recipe


class RecipeFilter(django_filters.FilterSet):
    tags = django_filters.AllValuesMultipleFilter(field_name='tags__slug')
    is_favorited = django_filters.NumberFilter(method='filter_is_favorited')
    is_in_shopping_cart = django_filters.NumberFilter(
        method='filter_is_in_shopping_cart'
    )

    class Meta:
        model = Recipe
        fields = ('tags', 'author')

    def filter_is_favorited(self, queryset, name, value):
        return filter_by_user_relation(
            queryset, self.request.user, value, 'favorites__user'
        )

    def filter_is_in_shopping_cart(self, queryset, name, value):
        return filter_by_user_relation(
            queryset, self.request.user, value, 'shopping_cart__user'
        )
