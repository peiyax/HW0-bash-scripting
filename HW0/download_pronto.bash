#!/bin/bash

mkdir -p pronto

echo "This directory contains the Pronto Cycle Share (Seattle) open bike data for year one (2014-2015): trips, stations, status, and weather." > pronto/README.txt

mkdir -p pronto/data

cd pronto/data
curl -O https://s3.amazonaws.com/pronto-data/open_data_year_one.zip

unzip -o open_data_year_one.zip

head 2015_trip_data.csv