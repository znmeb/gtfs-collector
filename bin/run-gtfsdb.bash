#! /bin/bash
#
# Copyright (C) 2016 M. Edward (Ed) Borasky <znmeb@znmeb.net>
# License: MIT

source /usr/share/virtualenvwrapper/virtualenvwrapper.sh
workon gtfsdb
pushd ~/Projects/gtfsdb
/usr/bin/time bin/gtfsdb-load \
  --database_url ${DATABASE_URL} --is_geospatial \
  ${GTFS_FEED}
popd
