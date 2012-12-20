#!/bin/bash

# Minecraft Update Script
# Author: Mark Ide <cranstonide@gmail.com>
# Github: https://github.com/cranstonide/linux-minecraft-scripts

# Move into the directory with all Linux-Minecraft-Scripts
cd "$( dirname $0 )"

# Read configuration file
source mc-config.cfg

#TODO - Only backup if $updateUrl != ""

# Backup the server
source mc-backup.sh

# Stop the server
source mc-stop.sh

# Delete the old jar file, download the new one.
rm -vf $minecraftDir/$minecraftJar
wget --output-document=$minecraftDir/$minecraftJar $updateUrl

# Start the server
source mc-start.sh
