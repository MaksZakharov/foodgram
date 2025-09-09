import os
import csv
from django.conf import settings
from django.core.management.base import BaseCommand
from recipes.models import Ingredient


class Command(BaseCommand):
    help = "Загрузка ингредиентов из файла data/ingredients.csv"

    def handle(self, *args, **options):
        # Формируем абсолютный путь к файлу внутри контейнера
        path = os.path.join(settings.BASE_DIR, "data", "ingredients.csv")

        if not os.path.exists(path):
            self.stderr.write(self.style.ERROR(f"Файл не найден: {path}"))
            return

        created, skipped = 0, 0

        with open(path, encoding="utf-8") as csvfile:
            reader = csv.reader(csvfile)
            for i, row in enumerate(reader, start=1):
                # Проверяем, что строка корректная
                if len(row) < 2:
                    self.stderr.write(
                        self.style.WARNING(f"Строка {i} пропущена: {row}")
                    )
                    skipped += 1
                    continue

                name, measurement_unit = row[0].strip(), row[1].strip()

                if not name or not measurement_unit:
                    self.stderr.write(
                        self.style.WARNING(f"Строка {i} пропущена: пустые значения")
                    )
                    skipped += 1
                    continue

                # Создаём ингредиент, если ещё нет
                obj, is_created = Ingredient.objects.get_or_create(
                    name=name, measurement_unit=measurement_unit
                )
                if is_created:
                    created += 1
                else:
                    skipped += 1

        self.stdout.write(
            self.style.SUCCESS(
                f"Ингредиенты загружены: {created} новых, {skipped} пропущено"
            )
        )
