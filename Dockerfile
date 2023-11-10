# Use a lightweight base image
FROM alpine:latest

ARG MYSQL_HOST="localhost"
ARG MYSQL_PORT="3306"
ARG MYSQL_USER="user"
ARG MYSQL_PASSWORD="password"
ARG MYSQL_DB="somedb"
ARG DB_DRIVER="mysql"
ARG SCRIPT_NAME="bulk_insert.lua"
ARG EVENTS="100"
ARG TIME="10"
ARG REPORT_INTERVAL="2"
ARG THREADS="2"

# Install MySQL client tools
RUN apk --no-cache add mysql-client nmap-ncat sysbench bash

# Set the default shell to bash
SHELL ["/bin/bash", "-c"]

COPY entrypoint.sh /usr/local/bin/entrypoint.sh

# Set execute permission
RUN chmod +x /usr/local/bin/entrypoint.sh

# Set the entry point
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]