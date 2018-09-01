#! /bin/bash
#
# Copyright (C) 2016 M. Edward (Ed) Borasky <znmeb@znmeb.net>
# License: MIT

cd /usr/local/src/gtfsdb
bin/gtfsdb-load \
  --database_url postgresql://gtfsdb:${GTFSDB_PASSWORD}@postgis:5432/gtfsdb \
  --is_geospatial \
  ${GTFS_FEED}
