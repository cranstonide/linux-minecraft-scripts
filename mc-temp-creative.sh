#!/bin/bash

# Minecraft Script to temprararily enable creative mode (just for fun)
# Github: https://github.com/cranstonide/linux-minecraft-scripts

# It's a good idea to back up before running this script. It does its own backup,
# but expecially during your first couple runs its a safe idea.

############################################
# Script Settings                          #
# (Note -NO- trailing slashes on paths)    #
############################################

# Where is Minecraft?
minecraftDir="/home/user/minecraft"

# Where do you want to store the temporary files?
tempDir="/home/user/temp-minecraft"

# How long (in minutes) should this mode last?
min=10

############################################
# End of settings; Do not modify below     #
############################################

# Alert the players that the server is going to be switching into TNT Mode.
screen -p 0 -S minecraft -X eval "stuff \"say Server will be entering TNT mode shortly.\"\015"
sleep 1
screen -p 0 -S minecraft -X eval "stuff \"say Shutting down to backup in 10 seconds.\"\015"
sleep 1
screen -p 0 -S minecraft -X eval "stuff \"say Please exit crafting blocks, dispensers, trades, chests and furnaces.\"\015"

# Wait a moment and stop the server to do the backup.
sleep 10
screen -p 0 -S minecraft -X eval "stuff \"stop\"\015"
sleep 10

# Backup the server into a temporary location.
rm -rvf $tempDir/
mkdir $tempDir/
cp -rvf $minecraftDir/ $tempDir/

# The server is now running in its temporary mode.
./mc-start.sh
sleep 10
screen -p 0 -S minecraft -X eval "stuff \"say The server is now in TNT mode.\"\015"
sleep 1
screen -p 0 -S minecraft -X eval "stuff \"say Please tell other players.\"\015"
sleep 1

# For the next $min minutes, display a countdown.
for ((c=$min; c>=0; c--))
do
sleep 60

############################################
# Creative Mode Actions Begin Here         #
############################################

   # This section id still under development.
   # give each person TNT
   for ((d=0; d<=4; d++))
   do
     while read line
     do
        screen -p 0 -S minecraft -X eval "stuff \"give $line 46 64\"\015"
        screen -p 0 -S minecraft -X eval "stuff \"give $line 76 64\"\015"
     done < /home/mark/minecraft/white-list.txt

   done

############################################
# Creative Mode Actions End Here           #
############################################

# This is the countdown.
screen -p 0 -S minecraft -X eval "stuff \"say TNT mode will last for another $c minutes.\"\015"
done

# Fun and games are over. Let's reset the server back to its original state.
screen -p 0 -S minecraft -X eval "stuff \"say TNT Mode is over. Hope you had fun.\"\015"
sleep 1
screen -p 0 -S minecraft -X eval "stuff \"say Restoring original (pre-TNT) map.\"\015"
sleep 10
screen -p 0 -S minecraft -X eval "stuff \"stop\"\015"
sleep 10

# Delete the temporary world (the one which was just in the $minecraft dir)
rm -rvf $minecraftDir

# Rename the backupDir to minecraftDir to restore the server to normal.
mv $tempDir $minecraftDir

# Restart the server. This time, normal.
./mc-start.sh
