def filter_by_user_relation(queryset, user, value, relation_field):
    """
    Фильтрует queryset по связи с пользователем.
    Если пользователь аутентифицирован и value=1 —
    возвращаются только объекты, связанные с пользователем.
    Во всех остальных случаях возвращается исходный queryset.
    """
    if user.is_authenticated and value == 1:
        return queryset.filter(**{relation_field: user})
    return queryset
