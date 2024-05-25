#!/bin/sh -x

login="admin"
password="password_123"
echo "Create databases - Start"
echo "1)"
influx -type 'influxql' -execute "CREATE USER $login WITH PASSWORD '$password' WITH ALL PRIVILEGES;"
echo "2)"
influx -type 'influxql' -execute "CREATE DATABASE artillery;"
echo "Create databases - Complete"


influx <<-EOSQL
CREATE RETENTION POLICY "autogen" ON "artillery" DURATION 0s REPLICATION 1 SHARD DURATION 1d DEFAULT;
EOSQL