#!/bin/bash
function shutdownGracefully() {
  echo "Valheim server PID: $1";
  kill -2 $1;
  wait $1;
  exit 0;
}

trap 'shutdownGracefully "$VALHEIM_PID"' SIGTERM;

cd /valheim;
./valheim_server.x86_64 -name $SERVER_NAME -password $PASSWORD \
  -savedir "/valheim/server-data" &>> "/valheim/server-data/server-logs.txt" &

VALHEIM_PID=$!;
echo "Server PID is: $VALHEIM_PID";

sleep infinity;