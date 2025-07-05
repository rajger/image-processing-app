# Build stage
FROM node:20 AS build

WORKDIR /app
COPY . .
RUN npm install && npm run build

# Serve with nginx
FROM nginx:alpine
COPY --from=build /app/build /usr/share/nginx/html

# Add a simple CORS config (optional)
COPY nginx.conf /etc/nginx/conf.d/default.conf
