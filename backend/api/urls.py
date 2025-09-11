from django.urls import path, include
from rest_framework.routers import DefaultRouter

from users.views import UserViewSet
# позже сюда же добавим RecipeViewSet, TagViewSet, IngredientViewSet

router = DefaultRouter()
router.register("users", UserViewSet, basename="users")

urlpatterns = [
    path("", include(router.urls)),
]
