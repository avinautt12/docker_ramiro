# Etapa 1: Construcción de Angular
FROM node:18 AS build
WORKDIR /app

# 👇 Primero pasamos las variables de entorno
ARG API_URL=http://localhost:3000
ARG MONGO_USER=admin
ARG MONGO_PASSWORD=luciano123

# Configura las variables como ENV para que Angular las use
ENV API_URL=$API_URL
ENV MONGO_USER=$MONGO_USER
ENV MONGO_PASSWORD=$MONGO_PASSWORD

COPY package.json package-lock.json ./
RUN npm install
COPY . .
RUN npm run build --prod -- --configuration=production

# Etapa 2: Servidor Nginx
FROM nginx:latest
COPY --from=build /app/dist/docker/browser/* /usr/share/nginx/html
COPY ./nginx/default.conf /etc/nginx/conf.d/default.conf
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
