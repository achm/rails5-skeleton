#!/bin/sh

sleep 5s

export MYSQL_PWD=${MYSQL_MASTER_PASSWORD}
log_file=`mysql -u root -h db_master -e "SHOW MASTER STATUS\G" | grep File: | awk '{print $2}'`
pos=`mysql -u root -h db_master -e "SHOW MASTER STATUS\G" | grep Position: | awk '{print $2}'`

export MYSQL_PWD=${MYSQL_ROOT_PASSWORD}
mysql -u root -e "CREATE DATABASE IF NOT EXISTS \`${MYSQL_TEST_DATABASE}\`;"
mysql -u root -e "GRANT ALL ON \`${MYSQL_TEST_DATABASE}\`.* TO '${MYSQL_USER}'@'%';"

mysql -u root -e "CHANGE MASTER TO MASTER_HOST='${MYSQL_MASTER_HOST}', MASTER_USER='${MYSQL_MASTER_USER}', MASTER_PASSWORD='${MYSQL_MASTER_PASSWORD}', MASTER_LOG_FILE='${log_file}', MASTER_LOG_POS=${pos};"
mysql -u root -e "START SLAVE"
