#! /bin/bash
#
# Copyright (C) 2016 M. Edward (Ed) Borasky <znmeb@znmeb.net>
# License: MIT

# create an unprivileged user for the database
createuser gtfsdb
command="ALTER USER gtfsdb WITH PASSWORD '${GTFSDB_PASSWORD}';"
psql --username=postgres -c "$command"

# create the database
createdb --owner=gtfsdb gtfsdb
psql --username=postgres --dbname=gtfsdb -c "CREATE EXTENSION postgis CASCADE;"
