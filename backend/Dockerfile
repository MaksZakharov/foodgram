# Создать образ на основе Python 3.10
FROM python:3.10

# Рабочая директория внутри контейнера
WORKDIR /app

# Копируем файл зависимостей
COPY requirements.txt .

# Устанавливаем зависимости Python
RUN pip install -r requirements.txt --no-cache-dir

# Копируем весь проект внутрь контейнера
COPY . .

# Команда запуска: Gunicorn на 8000 порту
CMD ["gunicorn", "--bind", "0.0.0.0:8000", "foodgram_backend.wsgi"]
