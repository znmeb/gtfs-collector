#! /bin/bash
#
# Copyright (C) 2016 M. Edward (Ed) Borasky <znmeb@znmeb.net>
# License: MIT

# create an unprivileged user for the database
createuser \
  --no-createdb \
  --no-inherit \
  --login \
  --no-createrole \
  --no-superuser \
  --no-replication \
  gtfsdb
command="ALTER USER gtfsdb WITH PASSWORD '${GTFSDB_PASSWORD}';"
psql --username=postgres -c "$command"

# create the database
createdb --owner=gtfsdb gtfsdb
psql --username=gtfsdb --dbname=gtfsdb -c "CREATE EXTENSION postgis CASCADE;"
