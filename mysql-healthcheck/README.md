mysql-healthcheck
=================

Example of how the new `HEALTHCHECK` instruction is used with Swarm mode.

From your local engine:

1. build the docker image
  ```
  docker build -t mbentley/mysql-healthcheck:latest .
  ```

2. push the image to docker hub
  ```
  docker push mbentley/mysql-healthcheck:latest
  ```

From you Swarm mode manager:

1. create a service
  ```
  docker service create --name mysql \
    -e MYSQL_ROOT_PASSWORD=root \
    -e MYSQL_DATABASE=testdb \
    --endpoint-mode vip -p 3306:3306 \
    --constraint node.hostname==swarm01 \
    --mode replicated --replicas 1 \
    mbentley/mysql-healthcheck:latest
  ```

2. watch the tasks
  ```
  watch docker service ps mysql
  ```

3. make the service unhealthy
  ```
  docker exec -it $(docker ps -f name=mysql -q) mysql -hlocalhost -uroot -proot -e "drop database testdb;"
  ```

4. watch as the service is modified to make the task healthy again
  ```
  watch docker ps -a
  ```
