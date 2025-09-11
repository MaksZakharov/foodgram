from django.contrib import admin
from django.urls import path, include
from rest_framework import permissions
from drf_yasg.views import get_schema_view
from drf_yasg import openapi
from rest_framework.routers import DefaultRouter
from users.views import UserViewSet

schema_view = get_schema_view(
    openapi.Info(
        title="Foodgram API",
        default_version="v1",
        description="Документация API для проекта Foodgram",
    ),
    public=True,
    permission_classes=(permissions.AllowAny,),
)

router = DefaultRouter()
router.register("users", UserViewSet, basename="users")

urlpatterns = [
    path("admin/", admin.site.urls),
    path("api/", include(router.urls)),
    path("api/", include("api.urls")),
    path("api/auth/", include("djoser.urls.authtoken")),  # 🔑 JWT авторизация
    path(
        "api/docs/", schema_view.with_ui("redoc", cache_timeout=0), name="schema-redoc"
    ),
]
