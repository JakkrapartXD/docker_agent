#!/bin/bash

MONGO_USER="root"
MONGO_PASS="P@ssw0rd"

mongosh -u "$MONGO_USER" -p "$MONGO_PASS" --authenticationDatabase admin /home/mongo_scripts/init-mongo.js

if [ $? -eq 0 ]; then
  echo "MongoDB setup successfully completed."
else
  echo "MongoDB setup failed."
fi
