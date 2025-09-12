from rest_framework import permissions


class IsAuthorOrReadOnly(permissions.BasePermission):
    """
    Разрешает редактировать и удалять только автору рецепта.
    Остальные пользователи имеют доступ только на чтение.
    """

    def has_permission(self, request, view):
        # Анонимам разрешаем только безопасные методы
        if request.method in permissions.SAFE_METHODS:
            return True
        return request.user and request.user.is_authenticated

    def has_object_permission(self, request, view, obj):
        if request.method in permissions.SAFE_METHODS:
            return True
        return obj.author == request.user
