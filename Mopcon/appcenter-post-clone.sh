#!/usr/bin/env bash

openssl des-cbc -d -k MOPCON201905161737 -in secrets.tar.enc -out secrets.tar
tar xvf ./secrets.tar
cd app_json
mv Quiz.json ..
mv BoothMission.json ..
cd ..
mv Quiz.json Mopcon/JSON
mv BoothMission.json Mopcon/JSON
