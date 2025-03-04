# Этап 1: Сборка приложения
FROM node:18-alpine AS build
WORKDIR /app

# Копируем package.json и package-lock.json
COPY package*.json ./

# Устанавливаем зависимости
RUN npm ci

# Копируем исходный код
COPY . .

# Собираем Angular-приложение
RUN npm run build -- --configuration production

# Этап 2: Финальный образ
FROM nginx:alpine

# Копируем собранные файлы из этапа сборки
COPY --from=build /app/dist/demo/browser /usr/share/nginx/html
COPY ./dist/demo/browser/images/* /usr/share/nginx/html/browser/images/*
# Копируем конфигурацию Nginx (если нужно)
# COPY nginx.conf /etc/nginx/conf.d/default.conf

# Открываем порт 80
EXPOSE 80

# Запускаем Nginx
CMD ["nginx", "-g", "daemon off;"]
