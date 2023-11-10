#!/bin/bash -xv

# Prepare
sysbench \
  --mysql-host="${MYSQL_HOST}" \
  --mysql-port="${MYSQL_PORT:-3306}" \
  --mysql-user="${MYSQL_USER}" \
  --mysql-password="${MYSQL_PASSWORD}" \
  --mysql-db="${MYSQL_DB}" \
  --db-driver="${DB_DRIVER:-mysql}" \
  /usr/share/sysbench/"${SCRIPT_NAME}" prepare

# Run
sysbench \
  --mysql-host="${MYSQL_HOST}" \
  --mysql-port="${MYSQL_PORT:-3306}" \
  --mysql-db="${MYSQL_DB}" \
  --mysql-user="${MYSQL_USER}" \
  --mysql-password="${MYSQL_PASSWORD}" \
  --events="${EVENTS:-0}" \
  --db-driver="${DB_DRIVER:-mysql}" \
  --time="${TIME:-15}" \
  --report-interval="${REPORT_INTERVAL:-5}" \
  --threads="${THREADS:-128}" \
  /usr/share/sysbench/"${SCRIPT_NAME}" run

# Cleanup
sysbench \
  --mysql-host="${MYSQL_HOST}" \
  --mysql-port="${MYSQL_PORT:-3306}" \
  --mysql-db="${MYSQL_DB}" \
  --mysql-user="${MYSQL_USER}" \
  --mysql-password="${MYSQL_PASSWORD}" \
  --db-driver="${DB_DRIVER:-mysql}" \
  /usr/share/sysbench/"${SCRIPT_NAME}" cleanup

echo "List of tests for future reference"
ls -1 /usr/share/sysbench/*.lua | xargs -n1 basename