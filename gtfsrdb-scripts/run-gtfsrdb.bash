#! /bin/bash
#
# Copyright (C) 2016 M. Edward (Ed) Borasky <znmeb@znmeb.net>
# License: MIT

cd /usr/local/src/gtfsrdb
/usr/bin/python3 ./gtfsrdb.py \
  --trip-updates ${TRIP_UPDATE_URL}?appID=${appID} \
  --alerts ${SERVICE_ALERT_URL}?appID=${appID} \
  --vehicle-positions ${VEHICLE_POSITION_URL}?appID=${appID} \
  --database postgresql://gtfsdb:${GTFSDB_PASSWORD}@postgis:5432/gtfsdb \
  --create-tables \
  --quiet
