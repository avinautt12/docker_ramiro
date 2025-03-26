# Fase de construcción
FROM node:18 AS builder  
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build  # Genera /dist

# Fase de producción (con Nginx)
FROM nginx:alpine
COPY --from=builder /app/dist/docker /usr/share/nginx/html  
COPY nginx/nginx.conf /etc/nginx/conf.d/default.conf
EXPOSE 80