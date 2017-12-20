#!/bin/bash

if [ ! -f $SAVEFILE ]; then
  /opt/factorio/bin/x64/factorio --create $SAVEFILE
fi
/opt/factorio/bin/x64/factorio --start-server $SAVEFILE
