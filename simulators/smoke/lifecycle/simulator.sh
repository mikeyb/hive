#!/bin/sh
set -e

# Start a new client node
echo -n "Starting a new client..."
id=`curl -sf -X POST $HIVE_SIMULATOR/nodes`
echo $id

# Retrieve it's genesis block
ip=`curl -sf $HIVE_SIMULATOR/nodes/$id`
curl -sf -X POST --data '{"jsonrpc":"2.0","method":"eth_getBlockByNumber","params":["0x0", false],"id":0}' $ip:8545

# Terminate the client
curl -sf -X DELETE $HIVE_SIMULATOR/nodes/$id
