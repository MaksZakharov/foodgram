from django.contrib import admin
from django.contrib.auth import get_user_model

User = get_user_model()


@admin.register(User)
class UserAdmin(admin.ModelAdmin):
    """Админка для пользователей."""

    list_display = ("id", "username", "email", "first_name", "last_name", "is_staff")
    search_fields = ("username", "email")
    list_filter = ("is_staff", "is_superuser")
    ordering = ("id",)
