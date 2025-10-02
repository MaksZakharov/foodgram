from django.contrib.auth.models import AbstractUser
from django.db import models
from django.utils.translation import gettext_lazy as _

from users.constants import (
    USER_EMAIL_MAX_LENGTH,
    USER_FIRST_NAME_MAX_LENGTH,
    USER_LAST_NAME_MAX_LENGTH,
)


class User(AbstractUser):
    """
    Кастомная модель пользователя.

    - Авторизация по email вместо username.
    - Дополнительное поле avatar.
    """

    email = models.EmailField(
        _('email address'),
        unique=True,
        max_length=USER_EMAIL_MAX_LENGTH,
    )
    avatar = models.ImageField(
        upload_to='users/',
        blank=True,
        null=True,
        verbose_name='Аватар',
    )
    first_name = models.CharField(
        max_length=USER_FIRST_NAME_MAX_LENGTH,
        verbose_name='Имя',
    )
    last_name = models.CharField(
        max_length=USER_LAST_NAME_MAX_LENGTH,
        verbose_name='Фамилия',
    )

    USERNAME_FIELD = 'email'
    REQUIRED_FIELDS = ['username', 'first_name', 'last_name']

    class Meta:
        verbose_name = 'Пользователь'
        verbose_name_plural = 'Пользователи'
        ordering = ('id',)

    def __str__(self):
        """Возвращает email как строковое представление пользователя."""
        return self.email


class Follow(models.Model):
    """
    Подписка одного пользователя на другого.

    Атрибуты:
        user — подписчик,
        author — автор, на которого оформлена подписка.
    """

    user = models.ForeignKey(
        User,
        on_delete=models.CASCADE,
        related_name='follower',
        verbose_name='Подписчик',
    )
    author = models.ForeignKey(
        User,
        on_delete=models.CASCADE,
        related_name='following',
        verbose_name='Автор',
    )

    class Meta:
        verbose_name = 'Подписка'
        verbose_name_plural = 'Подписки'
        constraints = [
            models.UniqueConstraint(
                fields=['user', 'author'],
                name='unique_follow',
            ),
        ]
        ordering = ('user', 'author')

    def __str__(self):
        """Возвращает строку вида «user подписан на author»."""
        return f'{self.user} подписан на {self.author}'
