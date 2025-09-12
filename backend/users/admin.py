from django.contrib import admin
from django.contrib.auth import get_user_model

from .models import Follow, User

User = get_user_model()


@admin.register(User)
class UserAdmin(admin.ModelAdmin):
    """Админка для пользователей."""

    list_display = (
        'id',
        'username',
        'email',
        'first_name',
        'last_name',
        'is_staff',
    )
    search_fields = ('username', 'email')
    list_filter = ('is_staff', 'is_superuser')
    ordering = ('id',)


@admin.register(Follow)
class FollowAdmin(admin.ModelAdmin):
    """Админка для управления подписками."""

    list_display = ('id', 'user', 'author')
    search_fields = ('user__username', 'author__username')
    list_filter = ('user', 'author')
