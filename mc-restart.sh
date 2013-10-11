#!/bin/bash

# Minecraft Restart Script
# Github: https://github.com/cranstonide/linux-minecraft-scripts

# Move into the directory with all Linux-Minecraft-Scripts
cd "$( dirname $0 )"

# Read configuration file
source mc-config.cfg

# Stop the server
source mc-stop.sh

# Start the server
source mc-start.sh
