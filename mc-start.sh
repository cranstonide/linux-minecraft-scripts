#!/bin/bash

# Minecraft Startup Script                  
# Author: Mark Ide <cranstonide@gmail.com> 
# Github: https://github.com/cranstonide/linux-minecraft-scripts

# Location of the minecraft_server.jar (directory containing, no trailing slash)
minecraftDir="/home/user/minecraft"

# Move into the minecraft directory.
cd $minecraftDir

# Start the game in a GNU screen. It will detatch automatically.
screen -dmS minecraft java -Xmx1024M -Xms1024M -jar minecraft_server.jar nogui
