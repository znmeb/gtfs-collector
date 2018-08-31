#! /bin/bash
#
# Copyright (C) 2016 M. Edward (Ed) Borasky <znmeb@znmeb.net>
# License: MIT

cd ~/Projects/gtfsrdb
python3 ./gtfsrdb.py \
  --trip-updates ${TRIP_UPDATE_URL}?appID=${appID} \
  --alerts ${SERVICE_ALERT_URL}?appID=${appID} \
  --vehicle-positions ${VEHICLE_POSITION_URL}?appID=${appID} \
  --database ${DATABASE_URL} \
  --create-tables \
  --quiet
