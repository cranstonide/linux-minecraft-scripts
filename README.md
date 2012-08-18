Linux Minecraft Scripts
=======================
Scripts to aid in the hosting of vanilla* [Minecraft](http://www.minecraft.net) servers on a Linux enviornment.

Feel free to clone this repository into your server enviornment to add some much needed funciionality. 

Starting the Server
-------------------
Most of the scripts in this repo require Minecraft to run inside a GNU screen. This can be done using the `mc-start.sh` script as follows:

    ./mc-start.sh
    
or by running the command manually, as shown below:

    cd /home/user/minecraft/
    screen -dmS minecraft java -Xmx1024M -Xms1024M -jar minecraft_server.jar nogui

Accessing the Console
---------------------
If you need to reach the Minecraft console, you may do so by running the following command. 

    screen -r minecraft

Stopping the Server
-------------------
You can shut down the server (and give people a heads up) using the provided script.

    ./mc-stop.sh
    
You can also shut down the server by running the following command.

    screen -p 0 -S minecraft -X eval "stuff \"stop\"\015"

If you would like to manually shut down your server, you can reconnect to the console and run `stop` inside.


Notes
-----
These scripts are to help manage a [Minecraft](http://www.minecraft.net) server running on Linux. They are bash scripts; so they won't run on your Windows installation without some major refactoring. The installation also heavily relies on a working installation of [GNU Screen](http://www.gnu.org/software/screen/). 

 **These scripts have not been tested with any third party servers. They may work, but your milage may vary.*
