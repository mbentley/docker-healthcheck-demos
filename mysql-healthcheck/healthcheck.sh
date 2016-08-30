#!/bin/bash

mysql -hlocalhost -uroot -p${MYSQL_ROOT_PASSWORD} -D${MYSQL_DATABASE} -e "show tables;" || exit 1
