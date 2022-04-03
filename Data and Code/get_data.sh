#!/bin/bash
Node='W039'
set -e
echo "date,temp_ambient" > ambient.csv
echo "date,temp_system" > system.csv
curl -H 'Content-Type: application/json' https://data.sagecontinuum.org/api/v1/query -d '{"start":"2022-01-01","filter": {"sensor": "bme680", "name":"env.temperature","vsn":"'$Node'", "task":"iio-rpi"}}' | jq -r '[.timestamp,.value] | @csv' | sed "s/\"//g" >> ambient.csv
curl -H 'Content-Type: application/json' https://data.sagecontinuum.org/api/v1/query -d '{"start":"2022-01-01","filter": {"sensor": "bme280", "name":"env.temperature","vsn":"'$Node'"}}' | jq -r '[.timestamp,.value] | @csv' | sed "s/\"//g" >> system.csv
curl "https://www.atmos.anl.gov/ANLMET/anltower.not_qc" | tr -s " " | grep -v [a-z] | tr ":" " " > atmos_temp.csv
cat atmos_temp.csv | xargs -l bash -c 'date --date="Jan 1 - 1 days + $0 days + $1 hours + $2 minutes + 21600 seconds" +"%Y-%m-%dT%H:%M:%S+00:00"' > atmos_time.csv
cat atmos_temp.csv | cut -d " " -f 4- > atmos_temp1.csv
paste atmos_time.csv -d" "+ atmos_temp1.csv | tr " " "," | tr 'T' ' '>> atmos.csv
rm atmos_temp.csv atmos_time.csv atmos_temp1.csv
echo "date,temp_atmos_10,radW/m2,netW/m2" > atmos_15min.csv
cat atmos.csv | cut -d ',' -f 1,10,16,17 >> atmos_15min.csv