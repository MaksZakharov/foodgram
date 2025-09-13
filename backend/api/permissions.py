from rest_framework import permissions


class IsAuthorOrReadOnly(permissions.BasePermission):
    """
    Разрешение для объектов рецептов.

    - Любой пользователь может читать данные (GET, HEAD, OPTIONS).
    - Изменять или удалять объект может только его автор.
    """

    def has_permission(self, request, view):
        """
        Проверяет общие права на выполнение запроса.

        Аргументы:
            request — объект запроса.
            view — представление (View), к которому обращается пользователь.

        Возвращает:
            True — если запрос безопасный (чтение)
            или пользователь аутентифицирован.
            False — если пользователь неавторизован и запрос изменяет данные.
        """
        if request.method in permissions.SAFE_METHODS:
            return True
        return request.user and request.user.is_authenticated

    def has_object_permission(self, request, view, obj):
        """
        Проверяет права доступа к конкретному объекту.

        Аргументы:
            request — объект запроса.
            view — представление (View).
            obj — объект рецепта.

        Возвращает:
            True — если запрос безопасный
            или пользователь является автором объекта.
            False — во всех остальных случаях.
        """
        if request.method in permissions.SAFE_METHODS:
            return True
        return obj.author == request.user
