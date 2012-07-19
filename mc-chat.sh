#!/bin/bash

# Minecraft Script to view live chatlog of players
# Author: Mark Ide <cranstonide@gmail.com> 
# Github: https://github.com/cranstonide/linux-minecraft-scripts

# Where is your Minecraft Log?
log="/home/user/minecraft/server.log"

# How far back do you want to start? (In lines)
# A bigger number may cause your screen to flash.
lines=500

# Show recent chats and live ones until CTRL+C is pressed.
tail -n $lines -F $log | grep "[0-9]*-[0-9]*-[0-9]* [0-9]*:[0-9]*:[0-9]* \[INFO\] <[a-zA-Z0-9_]*> [^@].*"

