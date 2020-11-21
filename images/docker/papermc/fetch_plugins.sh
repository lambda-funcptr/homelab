#!/bin/sh

if [ -e /config/plugins.list ]; then
    PLUGINS=$(cat /config/plugins.list) 
    
    mkdir -p /plugins
    for plugin_url in PLUGINS; do
        $(wget $plugin_url)
    done
    cd ..
fi