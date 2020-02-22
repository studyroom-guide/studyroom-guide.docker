#!/usr/bin/env bash

# call default entrypoint
usr/local/bin/docker-entrypoint.sh "$@" &

# check if mongod is already running and the tmp init setup is done
PS_COMMAND="ps aux | grep '[m]ongod .*/etc/mongo/mongod.conf' | grep -v 'docker-entrypoint.sh'"
IS_MONGO_RUNNING=$( bash -c "${PS_COMMAND}" )
while [ -z "${IS_MONGO_RUNNING}" ]
do
  echo "[INFO] Waiting for the MongoDB setup to finish ..."
  sleep 1
  IS_MONGO_RUNNING=$( bash -c "${PS_COMMAND}" )
done
# wait for mongod to be ready for connections
sleep 3