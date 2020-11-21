#!/bin/sh

if [ -z "EULA" ]; then
    EULA=false
fi

mkdir -p data
cd /data

cp /srv/papermc/server.jar /data/server.jar
echo "eula=$EULA" > eula.txt

/usr/lib/jvm/java-11-openjdk/bin/java -jar server.jar $MC_OPTS nogui