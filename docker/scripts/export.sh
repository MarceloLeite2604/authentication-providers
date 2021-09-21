#!/bin/bash

# Script to export databases from Docker container to external file system.

pg_alpha_container_id=$(docker ps -a | grep pg-alpha | awk '{print $1;}');
pg_beta_container_id=$(docker ps -a | grep pg-beta | awk '{print $1;}');

function dump_database() {
  local container_hash=$1
  local database=$2
  local output_file=$database.dump

  echo "Exporting $database database to \"$output_file\" file."
  docker exec -u 0 $container_hash bash -c "pg_dump -U $database -d $database -F c -f /docker-entrypoint-initdb.d/$output_file";
}

dump_database $pg_alpha_container_id alpha;
dump_database $pg_beta_container_id beta;