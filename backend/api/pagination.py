from rest_framework.pagination import PageNumberPagination


class LimitPageNumberPagination(PageNumberPagination):
    """
    Кастомный пагинатор с поддержкой параметра `limit`.

    Позволяет управлять количеством объектов на странице
    через query-параметр `limit`.
    """

    page_size_query_param = 'limit'
