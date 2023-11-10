# Running

```console
docker run \
  -e MYSQL_HOST="host.docker.internal" \
  -e MYSQL_USER="root" \
  -e MYSQL_PASSWORD="Password123" \
  -e MYSQL_DB="some_db" \
  -e EVENTS="1000000" \
  -e TIME="30" \
  -e REPORT_INTERVAL="10" \
  -e THREADS="64" \
  -e SCRIPT_NAME="bulk_insert.lua" \
  mysql-sysbench:local  
```

```text
bulk_insert.lua
oltp_common.lua
oltp_delete.lua
oltp_insert.lua
oltp_point_select.lua
oltp_read_only.lua
oltp_read_write.lua
oltp_update_index.lua
oltp_update_non_index.lua
oltp_write_only.lua
select_random_points.lua
select_random_ranges.lua         
```
