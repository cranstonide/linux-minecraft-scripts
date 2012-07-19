#!/bin/bash

# Minecraft Script to view all authentications to the server
# Author: Mark Ide <cranstonide@gmail.com> 
# Github: https://github.com/cranstonide/linux-minecraft-scripts

# Where is your Minecraft Log?
log="/home/user/minecraft/server.log"

# How far back do you want to start? (In lines)
# A bigger number may cause your screen to flash.
lines=1500

# Show $lines number of recent authentications and show all new ones until CTRL+C is pressed.
tail -n $lines -F $log | grep -E "[0-9]*-[0-9]*-[0-9]* [0-9]*:[0-9]*:[0-9]* \[INFO\] [^/ ]"
