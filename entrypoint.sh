#!/bin/bash -xv

for COMMAND in "$@"; do
  case $COMMAND in
    "prepare")
      sysbench \
        --mysql-host="${MYSQL_HOST}" \
        --mysql-port="${MYSQL_PORT:-3306}" \
        --mysql-user="${MYSQL_USER}" \
        --mysql-password="${MYSQL_PASSWORD}" \
        --mysql-db="${MYSQL_DB}" \
        --db-driver="${DB_DRIVER:-mysql}" \
        /usr/share/sysbench/"${SCRIPT_NAME}" prepare
      ;;
    "run")
      sysbench \
        --mysql-host="${MYSQL_HOST}" \
        --mysql-port="${MYSQL_PORT:-3306}" \
        --mysql-db="${MYSQL_DB}" \
        --mysql-user="${MYSQL_USER}" \
        --mysql-password="${MYSQL_PASSWORD}" \
        --max-requests="${MAX_REQUESTS:-0}" \
        --db-driver="${DB_DRIVER:-mysql}" \
        --time="${TIME:-15}" \
        --report-interval="${REPORT_INTERVAL:-5}" \
        --threads="${THREADS:-128}" \
        /usr/share/sysbench/"${SCRIPT_NAME}" run
      ;;
    "cleanup")
      sysbench \
        --mysql-host="${MYSQL_HOST}" \
        --mysql-port="${MYSQL_PORT:-3306}" \
        --mysql-db="${MYSQL_DB}" \
        --mysql-user="${MYSQL_USER}" \
        --mysql-password="${MYSQL_PASSWORD}" \
        --db-driver="${DB_DRIVER:-mysql}" \
        /usr/share/sysbench/"${SCRIPT_NAME}" cleanup
      ;;
    *)
      echo "Invalid command: $COMMAND. Supported commands: prepare, run, cleanup"
      exit 1
      ;;
  esac
done
