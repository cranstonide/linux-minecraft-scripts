#!/bin/bash

# Minecraft Stop Script
# Author: Mark Ide <cranstonide@gmail.com> 
# Github: https://github.com/cranstonide/linux-minecraft-scripts

# Alert the players that the server is going to be shut down.
screen -p 0 -S minecraft -X eval "stuff \"say Server will be shutting down in 10 seconds.\"\015"

# Wait a moment and stop the server.
sleep 10
screen -p 0 -S minecraft -X eval "stuff \"stop\"\015"
