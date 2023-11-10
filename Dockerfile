FROM alpine:3.18.4

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
RUN apk --no-cache add mysql-client=10.11.5-r0 nmap-ncat=7.93-r1 sysbench=1.0.20-r1 bash=5.2.15-r5

# Set the default shell to bash
SHELL ["/bin/bash", "-c"]

COPY entrypoint.sh /usr/local/bin/entrypoint.sh

# Set execute permission
RUN chmod +x /usr/local/bin/entrypoint.sh

# Set the entry point
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]