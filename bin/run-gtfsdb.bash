#! /bin/bash
#
# Copyright (C) 2016 M. Edward (Ed) Borasky <znmeb@znmeb.net>
# License: MIT

source ~/.virtualenvs/gtfsdb/bin/activate
cd ~/Projects/gtfsdb
bin/gtfsdb-load \
  --database_url ${DATABASE_URL} \
  --is_geospatial \
  ${GTFS_FEED}
