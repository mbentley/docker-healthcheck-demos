FROM mbentley/nginx:latest

RUN apk add --no-cache curl
RUN echo "hello world" > /var/www/index.html
HEALTHCHECK --interval=10s --timeout=5s CMD curl --fail -A "docker-healthcheck-curl/7.50.1" http://localhost:80/ || exit 1
