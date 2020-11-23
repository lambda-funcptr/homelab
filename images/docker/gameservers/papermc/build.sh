#!/bin/sh

cd $(dirname $0)

. ./buildvars

wget "https://papermc.io/api/v1/paper/$MC_VERSION/$PAPERMC_BUILD/download" -O server.jar