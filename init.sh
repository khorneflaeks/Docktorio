#!/bin/bash

if [ ! -f $SAVEFILE ]; then
  /opt/factorio/bin/x64/factorio --create $SAVEFILE --map-gen-settings $MAP_GEN_SETTINGS --map-settings $MAP_SETTINGS
fi
/opt/factorio/bin/x64/factorio --server-settings $SERVER_SETTINGS --map-settings $MAP_SETTINGS --start-server  $SAVEFILE 
