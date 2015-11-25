#!/usr/bin/env bash

if [ -d vendor-sonata-project ]; then

    echo "Setup can run only one"
    exit
fi

mv vendor/sonata-project vendor-sonata-project
mv vendor vendor-sf2-7
cp -rf vendor-sf2-7 vendor-sf2-8
cp -rf vendor-sf2-7 vendor-sf3-0

ln -s `pwd`/vendor-sonata-project vendor-sf2-7/vendor-sonata-project
ln -s `pwd`/vendor-sonata-project vendor-sf2-8/vendor-sonata-project
ln -s `pwd`/vendor-sonata-project vendor-sf3-0/vendor-sonata-project

./composer.sh update sf2-7
./composer.sh update sf2-8

# 3-0 not yet supported some deprecated notices or bundles (sonata and external) are not yet ready
#./composer.sh update sf3-0