#!/bin/sh

if [ -z "EULA" ]; then
    EULA=false
fi

mkdir -p /data/plugins
cd /data

cp /srv/papermc/server.jar /data/server.jar
echo "eula=$EULA" > eula.txt

if [ -e /config ]; then
    cp -R /config/* /data/.
fi

if [ -e /plugins ]; then
    cp -R /plugins /data
fi

/usr/lib/jvm/java-11-openjdk/bin/java -jar server.jar $MC_OPTS nogui