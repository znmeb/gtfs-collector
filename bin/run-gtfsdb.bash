#! /bin/bash
#
# Copyright (C) 2016 M. Edward (Ed) Borasky <znmeb@znmeb.net>
# License: MIT

source /usr/share/virtualenvwrapper/virtualenvwrapper.sh
workon gtfsdb
dropdb gtfsdb
createdb gtfsdb
psql -d gtfsdb -c "CREATE EXTENSION postgis CASCADE;"

pushd ~/Projects/gtfsdb
/usr/bin/time bin/gtfsdb-load \
  --database_url ${DATABASE_URL} --is_geospatial \
  ${GTFS_FEED}
popd
