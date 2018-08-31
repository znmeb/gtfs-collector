#! /bin/bash
#
# Copyright (C) 2016 M. Edward (Ed) Borasky <znmeb@znmeb.net>
# License: MIT

source /usr/share/virtualenvwrapper/virtualenvwrapper.sh
workon gtfsdb
pushd ~/Projects/gtfsrdb
python ./gtfsrdb.py \
  -t ${TRIP_UPDATE_URL}?appID=${appID} \
  -a ${SERVICE_ALERT_URL}?appID=${appID} \
  -p ${VEHICLE_POSITION_URL}?appID=${appID} \
  -d ${DATABASE_URL} -c
popd
