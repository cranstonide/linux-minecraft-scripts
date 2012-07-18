#!/bin/bash

############################################
# Minecraft Backup Script v0.4             #
# Author: Mark Ide <cranstonide@gmail.com> #
############################################

############################################
# Script Settings                          #
# (Note -NO- trailing slashes on paths)    #
############################################

# Where do you wish to store the backups
backupDir="/home/user/backups"

# Where are the files you wish to backup? The script will backup everything in this directory.
minecraftDir="/home/user/minecraft"

# Do you have more than one sever? What do you want to call this one?
severNick="minecraft"    

############################################
# End of settings; Do not modify below     #
############################################

# We need to first put the server in readonly mode to reduce the chance of backing up half of a chunk. 
screen -p 0 -S minecraft -X eval "stuff \"save-off\"\015"
screen -p 0 -S minecraft -X eval "stuff \"save-all\"\015"

# Wait a few seconds to make sure that Minecraft has finished backing up.
sleep 5

# Create a copy for the most recent server image directory (its a convient way to recover single player data or chunks without unzipping the whole archive)
# If you don't need a directory with the most recent image, please comment this section out.
rm -rvf $backupDir/$severNick-most-recent
mkdir $backupDir/$severNick-most-recent
cp -Rv $minecraftDir/* $backupDir/$severNick-most-recent

# Create an archived copy in .tar.gz format.
DATE=`date +%Y.%m.%d`
rm -rvf $backupDir/$severNick-$DATE.tar.gz
tar -cvzf $backupDir/$severNick-$DATE.tar.gz $minecraftDir/*

# Don't forget to take the server out of readonly mode.
screen -p 0 -S minecraft -X eval "stuff \"save-on\"\015"

# Wait a second for the gnu-screen to allow another stuffing and optionally alert users that the backup has been completed.
sleep 1
screen -p 0 -S minecraft -X eval "stuff \"say Backup has been completed.\"\015"

# (Optionally) Remove all old (older than 7 days) backups to cut down on disk utilization. 
find $backupDir* -mtime +7 -exec rm {} -fv \;
