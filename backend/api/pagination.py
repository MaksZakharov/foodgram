from rest_framework.pagination import PageNumberPagination
from rest_framework.response import Response


class LimitPageNumberPagination(PageNumberPagination):
    """
    Кастомный пагинатор с поддержкой параметра `limit`.

    Позволяет управлять количеством объектов на странице
    через query-параметр `limit`. Максимальный размер страницы ограничен.
    """

    page_size_query_param = 'limit'
    max_page_size = 100

    def get_paginated_response(self, data):
        """
        Формирует ответ с постраничной навигацией.

        Аргументы:
            data — список сериализованных объектов текущей страницы.

        Возвращает:
            Response с полями:
            - count: общее количество объектов,
            - next: ссылка на следующую страницу,
            - previous: ссылка на предыдущую страницу,
            - results: список объектов текущей страницы.
        """
        return Response(
            {
                'count': self.page.paginator.count,
                'next': self.get_next_link(),
                'previous': self.get_previous_link(),
                'results': data,
            }
        )
