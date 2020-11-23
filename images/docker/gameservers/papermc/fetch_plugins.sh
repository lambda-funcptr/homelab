#!/bin/sh

if [ -e /config/plugins.list ]; then
    PLUGINS=$(cat /config/plugins.list) 
    
    mkdir -p /plugins
    for PLUGIN_URL in PLUGINS; do
        $(wget $PLUGIN_URL)
    done
    cd ..
fi