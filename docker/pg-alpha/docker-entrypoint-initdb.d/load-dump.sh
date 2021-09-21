#!/bin/bash

name="alpha";
dump_file="/docker-entrypoint-initdb.d/$name.dump";

if [ ! -f "./$dump_file" ]; then
  echo "Dump file \"$dump_file\" not found. Skipping load.";
  exit 0;
fi;

echo "Loading dump file \"$dump_file\".";
file_name=$(basename -- "$dump_file");
database="${file_name%.*}";
pg_restore -U "$POSTGRES_USER" -F c -d $database $dump_file;
echo "Dump file \"$dump_file\" loaded on database.";