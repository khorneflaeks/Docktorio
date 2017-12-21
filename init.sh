#!/bin/bash

if [ ! -f $SAVEFILE ]; then
  /opt/factorio/bin/x64/factorio --create $SAVEFILE
fi
/opt/factorio/bin/x64/factorio --server-settings $SERVER_SETTINGS --start-server  $SAVEFILE
