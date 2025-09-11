from django.urls import path, include
from rest_framework.routers import DefaultRouter

from users.views import UserViewSet
from recipes.views import RecipeViewSet, TagViewSet, IngredientViewSet
# позже сюда же добавим RecipeViewSet, TagViewSet, IngredientViewSet

router = DefaultRouter()
router.register("users", UserViewSet, basename="users")
router.register("recipes", RecipeViewSet, basename="recipes")
router.register("tags", TagViewSet, basename="tags")
router.register("ingredients", IngredientViewSet, basename="ingredients")

urlpatterns = [
    path("", include(router.urls)),
]
