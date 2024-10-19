#!/bin/bash

MONGO_HOST="localhost"
MONGO_PORT="27017"

mongo --host "$MONGO_HOST" --port "$MONGO_PORT" < setup_wallboarddb.js

if [ $? -eq 0 ]; then
  echo "MongoDB setup successfully completed."
else
  echo "MongoDB setup failed."
fi
