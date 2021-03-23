#!/bin/sh

if [ "$EULA" != "true" ]; then
    echo "You need to agree to the Minecraft Server EULA!";
    exit -1;
fi

mkdir -p /data
cd /data

cp -a /srv/papermc/. /data/
echo "eula=$EULA" > eula.txt

if [ -e /config ]; then
    cp -a /config/. /data/.
fi

if [ ! -e /plugins ]; then
    sh fetch_plugins.sh
fi
# Only copy over plugins 
if [ -e /plugins ]; then
    mkdir -p /data/plugins
    cp -a /plugins/. /data/plugins/
fi

ln -s /dev/stdout /srv/papermc/log

/usr/lib/jvm/java-11-openjdk/bin/java $MC_OPTS -jar server.jar nogui > /srv/papermc/log