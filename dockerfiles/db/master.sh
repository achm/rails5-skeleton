#!/bin/sh

export MYSQL_PWD=${MYSQL_ROOT_PASSWORD}
mysql -u root -e "CREATE DATABASE IF NOT EXISTS \`${MYSQL_TEST_DATABASE}\`;"
mysql -u root -e "GRANT ALL ON \`${MYSQL_TEST_DATABASE}\`.* TO '${MYSQL_USER}'@'%';"
