from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status
from drf_yasg.utils import swagger_auto_schema


class PingView(APIView):
    @swagger_auto_schema(
        operation_description="Проверка доступности API",
        responses={200: "pong"},
    )
    def get(self, request):
        return Response({"message": "pong"}, status=status.HTTP_200_OK)
