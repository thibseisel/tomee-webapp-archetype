#!/bin/bash

version=${version}

echo 'Construction de MySQL...'
cd mysql/
./build-image.sh $version
cd ..

echo 'Construction de Tomee...'
cd tomee/
./build-image.sh $version
cd ..	
