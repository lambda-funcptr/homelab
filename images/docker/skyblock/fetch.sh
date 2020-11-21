#!/bin/sh

if [ -e /config/plugins.list ]; then
    PLUGINS=$(cat /config/plugins.list) 
    
    cd /data/plugins
    for plugin_url in PLUGINS; do
        wget "$plugin_url"
    done
    cd ..
fi