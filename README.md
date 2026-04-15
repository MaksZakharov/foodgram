# 📌 Foodgram — продуктовый помощник

# ![Foodgram CI/CD](https://github.com/MaksZakharov/foodgram/actions/workflows/main.yml/badge.svg)

[![Python](https://img.shields.io/badge/Python-3.10-blue.svg)](https://www.python.org/)
[![Django](https://img.shields.io/badge/Django-4.x-green.svg)](https://www.djangoproject.com/)
[![DRF](https://img.shields.io/badge/DRF-3.x-red.svg)](https://www.django-rest-framework.org/)
[![PostgreSQL](https://img.shields.io/badge/PostgreSQL-13+-blue.svg)](https://www.postgresql.org/)
[![Docker](https://img.shields.io/badge/Docker-20+-blue.svg)](https://www.docker.com/)
[![NGINX](https://img.shields.io/badge/NGINX-reverse--proxy-brightgreen.svg)](https://nginx.org/)

**Foodgram** — это веб-сервис для публикации рецептов и автоматизации процесса покупки ингредиентов.  
Пользователи могут сохранять рецепты, подписываться на авторов и формировать список покупок на основе выбранных блюд.

---

## 📖 Описание проекта

Проект решает практическую задачу: **упрощает планирование питания и закупку продуктов**.  
Вместо хранения рецептов в разных источниках пользователь получает единое пространство, где можно:

- хранить и структурировать рецепты  
- быстро находить интересные блюда  
- автоматически формировать список покупок  

## 🧠 Что реализовал

-   Разработал REST API для рецептов, пользователей и подписок
-   Реализовал бизнес-логику:
    -   избранное
    -   список покупок с агрегацией ингредиентов
    -   подписки на авторов
-   Настроил аутентификацию (Djoser, JWT)
-   Реализовал permissions, фильтрацию и пагинацию
-   Спроектировал модели данных (включая through-модели)
-   Оптимизировал запросы (select_related, prefetch_related)
-   Настроил инфраструктуру:
    -   Docker / docker-compose
    -   Gunicorn + Nginx
-   Подготовил production-конфигурацию

---

## 🚀 Основные возможности

- Регистрация и аутентификация пользователей  
- Публикация рецептов (ингредиенты, теги, изображения)  
- Подписка на авторов  
- Добавление рецептов в избранное  
- Формирование списка покупок  
- Выгрузка списка покупок в `.txt`  
- Фильтрация рецептов по тегам  
- Пагинация и ограничение выдачи  

---

## 🛠 Технологический стек

**Backend:**
- Python 3.10  
- Django  
- Django REST Framework  
- Djoser  

**Frontend:**
- React  
- Node.js  

**База данных:**
- PostgreSQL  

**Инфраструктура:**
- Docker / docker-compose  
- Gunicorn  
- Nginx  

**Документация API:**
- OpenAPI (ReDoc)  

---

## 🚀 Деплой

Проект разворачивал на удалённом сервере с использованием Docker,
Gunicorn и Nginx.\
Настраивал CI/CD pipeline для автоматического деплоя.

---

## ⚙️ Установка и запуск (Docker)

### Требования:
- Docker 20+  
- docker-compose  

---

### 1. Клонирование репозитория

```bash
git clone <ссылка_на_репозиторий>
cd foodgram/infra
```

---

### 2. Настройка переменных окружения

Создайте файл `.env` в директории `infra/`:

```env
DB_ENGINE=django.db.backends.postgresql
DB_NAME=postgres
POSTGRES_USER=postgres
POSTGRES_PASSWORD=postgres
DB_HOST=db
DB_PORT=5432

SECRET_KEY=your_secret_key
DEBUG=False
ALLOWED_HOSTS=127.0.0.1,localhost
```

---

### 3. Запуск контейнеров

```bash
docker compose up -d --build
```

---

### 4. Подготовка приложения

```bash
docker compose exec backend python manage.py migrate
docker compose exec backend python manage.py createsuperuser
docker compose exec backend python manage.py collectstatic --noinput
```

---

### 5. Загрузка данных

```bash
docker compose exec backend python manage.py load_ingredients
```

---

## 🌐 Доступ к сервису

- Главная страница: http://localhost  
- API: http://localhost/api/  
- Документация: http://localhost/api/docs/  

---

## 📡 Примеры API-запросов

- Регистрация пользователя  
  ```
  POST /api/users/
  ```

- Получение токена  
  ```
  POST /api/auth/token/login/
  ```

- Получение списка рецептов  
  ```
  GET /api/recipes/
  ```

- Добавление в избранное  
  ```
  POST /api/recipes/{id}/favorite/
  ```

- Подписка на автора  
  ```
  POST /api/users/{id}/subscribe/
  ```

- Скачать список покупок  
  ```
  GET /api/recipes/download_shopping_cart/
  ```

---

## 🔮 Планы по доработке

- Добавить кеширование (Redis) для ускорения выдачи рецептов  
- Реализовать систему лайков и рейтинга рецептов  
- Покрыть проект тестами (pytest)  
- Ограничить частоту запросов (rate limiting)  

---

## 👤 Автор

**Maks Zakharov**
