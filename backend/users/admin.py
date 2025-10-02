from django.contrib import admin
from django.contrib.auth.admin import UserAdmin as BaseUserAdmin

from users.models import Follow, User


@admin.register(User)
class UserAdmin(BaseUserAdmin):
    """Админка для пользователей."""

    list_display = (
        'id',
        'username',
        'email',
        'first_name',
        'last_name',
        'is_staff',
        'recipes_count',
        'followers_count',
    )
    search_fields = ('username', 'email')
    list_filter = ('is_staff', 'is_superuser')
    ordering = ('id',)

    @admin.display(description='Рецептов')
    def recipes_count(self, obj):
        """Количество рецептов пользователя."""
        return obj.recipes.count()

    @admin.display(description='Подписчики')
    def followers_count(self, obj):
        """Количество подписчиков у пользователя."""
        return obj.following.count()


@admin.register(Follow)
class FollowAdmin(admin.ModelAdmin):
    """Админка для управления подписками."""

    list_display = ('id', 'user', 'author')
    search_fields = ('user__username', 'author__username')
    list_filter = ('user', 'author')
