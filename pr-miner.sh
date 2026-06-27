#!/usr/bin/env bash
set -e

PRL_ADDRESS="prl1ph5guus9m42ud46dpqfu62a5ryacxtw2rzawf6qg9nzcezl59g0lsn68tq7"
PRL_PROXY="47.86.91.30:50801"
PRL_WORKER="${CONTAINER_ID:-$(hostname)}"

apt-get update
DEBIAN_FRONTEND=noninteractive apt-get install -y wget ca-certificates tar

cd /workspace
wget -c https://github.com/pearlfortune/pearl-miner/releases/download/v1.1.8/pearlfortune-v1.1.8.tar.gz
tar vxzf pearlfortune-v1.1.8.tar.gz

cd pearlfortune
chmod +x miner-cuda12

./miner-cuda12 \
  --proxy "${PRL_PROXY}" \
  --address "${PRL_ADDRESS}" \
  --worker "${PRL_WORKER}" \
  -gpu
