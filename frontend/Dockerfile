# Étape 1 : Build Angular
FROM node:20-alpine AS build
WORKDIR /app
COPY . .
RUN npm install && npm run build -- --configuration production

# Étape 2 : Serveur Nginx avec les fichiers Angular
FROM nginx:alpine
COPY --from=build /app/dist/onadapp /usr/share/nginx/html
COPY ./nginx/default.conf /etc/nginx/conf.d/default.conf