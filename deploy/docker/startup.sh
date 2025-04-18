#!/bin/bash

grafana server &

sleep 10s

grr config set grafana.url http://localhost:3000
grr config set grafana.user admin
grr config set grafana.token admin
grr apply ./intersight-grafana/grafana_elements/

tail -f /dev/null