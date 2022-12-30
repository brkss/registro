#!/bin/bash

docker exec -t server-postgres-1 pg_dumpall -c -U root > registro_`date +%d-%m-%Y"_"%H_%M_%S`.sql
