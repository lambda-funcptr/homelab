#!/bin/sh

cd $(dirname $0)

MC_VERSION=1.16.5
PAPERMC_BUILD=566

wget "https://papermc.io/api/v1/paper/$MC_VERSION/$PAPERMC_BUILD/download" -O server.jar