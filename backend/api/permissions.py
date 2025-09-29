from rest_framework import permissions


class IsAuthorOrReadOnly(permissions.BasePermission):
    """
    Разрешение для объектов рецептов.

    - Любой пользователь может читать данные (GET, HEAD, OPTIONS).
    - Изменять или удалять объект может только его автор.
    """
   
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
        return (
            request.method in permissions.SAFE_METHODS
            or obj.author == request.user
        )


