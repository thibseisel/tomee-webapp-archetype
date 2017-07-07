#!/bin/bash

vers=${version}

echo 'Constructing Mariadb's image ...'
cd mariadb/
./build-image.sh $vers
cd ..

echo 'Constructing TomEE's image ...'
cd tomee/
./build-image.sh $vers
cd ..	
