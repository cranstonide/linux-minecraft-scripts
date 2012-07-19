#!/bin/bash

# Minecraft Time Setter
# Author: Mark Ide <cranstonide@gmail.com> 
# Github: https://github.com/cranstonide/linux-minecraft-scripts

# Make sure there was an argument passed into the script
if [ $# -eq 0 ]
then
    echo "You did not specify a time to set the server to."
    echo "Usage: ./mc-time.sh TIME"
    exit $E_NO_ARGS
fi

# Make sure the user actually passed a number
if ! [[ "$1" =~ ^[0-9]+$ ]]
then
    echo "Expecting integer, recieved $1."
    echo "Usage: ./mc-time.sh TIME"
    exit 1
fi

# Make sue the number they passed isn't too big.
# Negative numbers are handled by the above conditional (they're not integers, but rather strings.)
if [ $1 -gt 18000 ]
then
    echo "Time too large. Range is 0 < time < 18000."
    exit 1
fi

# Send the time set command into 
screen -p 0 -S minecraft -X eval "stuff \"time set $1\"\015"

# (Optionally) Tell the players that the time has changed.
# screen -p 0 -S minecraft -X eval "stuff \"say Time has been set to $1.\"\015"

