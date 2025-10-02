def filter_by_user_relation(queryset, user, value, relation_field):
    """
    Фильтрует queryset по связи с пользователем.

    Если пользователь аутентифицирован и передан флаг value,
    возвращаются только объекты, связанные с этим пользователем.
    Во всех остальных случаях возвращается исходный queryset.
    """
    if user.is_authenticated and value:
        return queryset.filter(**{relation_field: user})
    return queryset
