#!/bin/bash

vers=${version}

echo 'Starting Mariadb ...'
cd mariadb/
./run-image.sh $vers
cd ..

echo 'Starting TomEE ...'
cd tomee/
./run-image.sh $vers
cd ..
