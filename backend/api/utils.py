def filter_by_user_relation(queryset, user, value, relation_field):
    """Универсальный фильтр по связанной модели пользователя."""
    if not user.is_authenticated:
        return queryset
    if value == 1:
        return queryset.filter(**{relation_field: user})
    if value == 0:
        return queryset.exclude(**{relation_field: user})
    return queryset
