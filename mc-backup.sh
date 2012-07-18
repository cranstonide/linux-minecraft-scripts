#!/bin/bash

############################################
# Minecraft Backup Script v0.4             #
# Author: Mark Ide <cranstonide@gmail.com> #
############################################

# We need to first put the server in readonly mode to reduce the chance of backing up half of a chunk. 
screen -p 0 -S minecraft -X eval "stuff \"save-off\"\015"
screen -p 0 -S minecraft -X eval "stuff \"save-all\"\015"

# Wait a few seconds to make sure that Minecraft has finished backing up.
sleep 5

# Create a copy for the most recent server image directory (its a convient way to recover single player data or chunks without unzipping the whole archive)
# If you don't need a directory with the most recent image, please comment this section out.
rm -rvf /home/user/backups/server-most-recent
mkdir /home/user/backups/server-most-recent
cp -Rv /home/user/minecraft/* /home/user/backups/server-most-recent

# Create an archived copy in .tar.gz format.
DATE=`date +%Y.%m.%d`
rm -rvf /home/user/backups/server-$DATE.tar.gz
tar -cvzf /home/user/backups/server-$DATE.tar.gz /home/user/minecraft/*

# Don't forget to take the server out of readonly mode.
screen -p 0 -S minecraft -X eval "stuff \"save-on\"\015"

# Wait a second for the gnu-screen to allow another stuffing and optionally alert users that the backup has been completed.
sleep 1
screen -p 0 -S minecraft -X eval "stuff \"say Backup has been completed.\"\015"

# (Optionally) Remove all old (older than 7 days) backups to cut down on disk utilization. 
find /home/user/backups* -mtime +7 -exec rm {} -fv \;
