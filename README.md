# 🍲 Foodgram — продуктовый помощник

[![Python](https://img.shields.io/badge/Python-3.10-blue.svg)](https://www.python.org/)
[![Django](https://img.shields.io/badge/Django-4.x-green.svg)](https://www.djangoproject.com/)
[![DRF](https://img.shields.io/badge/DRF-3.x-red.svg)](https://www.django-rest-framework.org/)
[![PostgreSQL](https://img.shields.io/badge/PostgreSQL-13+-blue.svg)](https://www.postgresql.org/)
[![Docker](https://img.shields.io/badge/Docker-20+-blue.svg)](https://www.docker.com/)
[![NGINX](https://img.shields.io/badge/NGINX-reverse--proxy-brightgreen.svg)](https://nginx.org/)

**Foodgram** — это онлайн-сервис для публикации и хранения рецептов.  
Здесь пользователи могут делиться любимыми блюдами, сохранять рецепты в избранное и формировать список покупок.

📌 Проект создан в рамках обучения в **Яндекс Практикуме**, но полностью реализован самостоятельно. 

---

## 🚀 Возможности проекта

- Регистрация и авторизация пользователей.
- Публикация рецептов с фотографиями, ингредиентами и тегами.
- Подписка на других авторов и просмотр их рецептов.
- Добавление рецептов в избранное.
- Формирование списка покупок с возможностью скачать его в текстовом файле.
- Фильтрация рецептов по тегам.
- Поддержка пагинации и ограничений (`limit`).

---

## 🛠 Технологии

- **Backend**: Python 3.10, Django, Django REST Framework, Djoser  
- **Frontend**: React, Node.js  
- **База данных**: PostgreSQL  
- **Инфраструктура**: Docker, docker-compose, Gunicorn, Nginx  
- **Документация API**: ReDoc (OpenAPI)  

---

## ⚙️ Установка и запуск проекта (Docker)

1. Клонируйте репозиторий:
   ```bash
   git clone <ссылка_на_репозиторий>
   cd foodgram/infra
   ```

2. Создайте файл `.env` в директории `infra/` и заполните его переменными окружения:
   ```env
   DB_ENGINE=django.db.backends.postgresql
   DB_NAME=postgres
   POSTGRES_USER=postgres
   POSTGRES_PASSWORD=postgres
   DB_HOST=db
   DB_PORT=5432

   SECRET_KEY=секретный_ключ_django
   DEBUG=False
   ALLOWED_HOSTS=127.0.0.1,localhost
   ```

3. Поднимите контейнеры:
   ```bash
   docker compose up -d --build
   ```

4. Выполните миграции, создайте суперпользователя и соберите статику:
   ```bash
   docker compose exec backend python manage.py migrate
   docker compose exec backend python manage.py createsuperuser
   docker compose exec backend python manage.py collectstatic --noinput
   ```

5. Загрузите ингредиенты:
   ```bash
   docker compose exec backend python manage.py load_ingredients
   ```

---

## 🔗 Доступ к сервису

- Главная страница: [http://localhost](http://localhost)  
- API: [http://localhost/api/](http://localhost/api/)  
- Документация API: [http://localhost/api/docs/](http://localhost/api/docs/)  

---

## 📋 Примеры API-запросов

- **Регистрация пользователя**
  ```
  POST /api/users/
  ```

- **Получение токена**
  ```
  POST /api/auth/token/login/
  ```

- **Список рецептов**
  ```
  GET /api/recipes/
  ```

- **Добавить в избранное**
  ```
  POST /api/recipes/{id}/favorite/
  ```

- **Подписка на автора**
  ```
  POST /api/users/{id}/subscribe/
  ```

- **Скачать список покупок**
  ```
  GET /api/recipes/download_shopping_cart/
  ```

---

## 👨‍💻 Автор проекта
**Maks Zakharov**

## Проект доступен по адресу

**foodgram.3utilities.com**
