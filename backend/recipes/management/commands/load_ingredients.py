import csv
import os

from django.conf import settings
from django.core.management.base import BaseCommand

from recipes.models import Ingredient


class Command(BaseCommand):
    """
    Команда Django для загрузки ингредиентов из CSV-файла.

    Файл должен находиться в папке `data/` внутри проекта
    и называться `ingredients.csv`.
    Формат файла: каждая строка содержит два поля —
    название ингредиента и единицу измерения.

    Пример строки:
        Лук репчатый,г
    """

    help = 'Загрузка ингредиентов из файла data/ingredients.csv'

    def handle(self, *args, **options):
        """
        Основной метод, который выполняется при запуске команды.

        Шаги выполнения:
        1. Проверяет наличие файла `data/ingredients.csv`.
        2. Читает файл построчно.
        3. Валидирует каждую строку (должно быть два непустых значения).
        4. Добавляет ингредиент в базу данных, если он ещё не существует.
        5. Подсчитывает количество новых и пропущенных строк.
        6. Выводит результат в консоль.

        Аргументы:
            *args — дополнительные позиционные аргументы (не используются).
            **options — именованные аргументы (не используются).

        Возвращает:
            None. Сообщения выводятся в stdout/stderr.
        """
        path = os.path.join(settings.BASE_DIR, 'data', 'ingredients.csv')

        if not os.path.exists(path):
            self.stderr.write(self.style.ERROR(f'Файл не найден: {path}'))
            return

        created, skipped = 0, 0

        with open(path, encoding='utf-8') as csvfile:
            reader = csv.reader(csvfile)
            for i, row in enumerate(reader, start=1):
                if len(row) < 2:
                    self.stderr.write(
                        self.style.WARNING(f'Строка {i} пропущена: {row}')
                    )
                    skipped += 1
                    continue

                name, measurement_unit = row[0].strip(), row[1].strip()

                if not name or not measurement_unit:
                    self.stderr.write(
                        self.style.WARNING(
                            f'Строка {i} пропущена: пустые значения'
                        )
                    )
                    skipped += 1
                    continue

                obj, is_created = Ingredient.objects.get_or_create(
                    name=name, measurement_unit=measurement_unit
                )
                if is_created:
                    created += 1
                else:
                    skipped += 1

        self.stdout.write(
            self.style.SUCCESS(
                f'Ингредиенты загружены: {created} новых, {skipped} пропущено'
            )
        )
