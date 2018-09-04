#! /bin/bash
#
# Copyright (C) 2016 M. Edward (Ed) Borasky <znmeb@znmeb.net>
# License: MIT

source activate gtfsdb
which conda

echo "Creating database superuser 'gtfsdb'"
createuser --superuser gtfsdb

echo "Creating database 'gtfsdb'"
dropdb gtfsdb
createdb --owner=gtfsdb gtfsdb
psql --dbname=gtfsdb --username=gtfsdb --command "CREATE EXTENSION postgis CASCADE;"

echo "Running the GTFS data insertion"
cd gtfsdb
/usr/bin/time bin/gtfsdb-load \
  --database_url postgresql://znmeb@localhost:5432/gtfsdb --is_geospatial \
  http://developer.trimet.org/schedule/gtfs.zip  

echo "Creating a directory for backups"
mkdir -p ~/Backups
echo "Creating database dump in auto-restorable format"
/usr/bin/time pg_dump \
  --format=p \
  --verbose \
  --clean \
  --create \
  --if-exists \
  --dbname=gtfsdb \
  | gzip -c > ~/Backups/gtfsdb.tar.gz
