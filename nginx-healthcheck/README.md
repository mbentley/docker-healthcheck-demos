nginx-healthcheck
=================

Example of how the new `HEALTHCHECK` instruction is used with Swarm mode.

From your local engine:

1. build the docker image
  ```
  docker build -t mbentley/nginx-healthcheck:latest .
  ```

2. push the image to docker hub
  ```
  docker push mbentley/nginx-healthcheck:latest
  ```

From you Swarm mode manager:

1. create a service
  ```
  docker service create --name nginx \
    --endpoint-mode vip -p 80:80 \
    --mode replicated --replicas 3 \
    mbentley/nginx-healthcheck:latest
  ```

2. watch the tasks
  ```
  watch docker service ps nginx
  ```

3. make the service unhealthy
  ```
  docker exec -it $(docker ps -f name=nginx -q) rm /var/www/index.html
  ```

4. watch as the service is modified to make the task healthy again
  ```
  watch docker ps -a
  ```
