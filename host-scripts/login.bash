#! /bin/bash

if [ "$#" -gt 0 ]
then
  docker exec -it -e LINES=$(tput lines) -e COLUMNS=$(tput cols) -u ${1} gtfs-collector_gtfs-collector_1 /bin/bash
else
  docker exec -it -e LINES=$(tput lines) -e COLUMNS=$(tput cols) -u gtfsdb gtfs-collector_gtfs-collector_1 /bin/bash
fi
