#!/bin/bash

vers=${version}

echo 'Construction de MySQL...'
cd mysql/
./build-image.sh $vers
cd ..

echo 'Construction de Tomee...'
cd tomee/
./build-image.sh $vers
cd ..	
