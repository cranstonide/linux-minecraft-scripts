Linux Minecraft Scripts
=======================
Scripts to aid in the hosting of vanilla* [Minecraft](http://www.minecraft.net) servers on a Linux enviornment.

Feel free to clone this repository into your server enviornment to add some much needed funciionality. 

Setting up Enviornment
----------------------
In order to use these scripts, you'll just have to clone the repository. Make sure you have `git`, `screen`, and `java` installed.

    git clone https://github.com/cranstonide/linux-minecraft-scripts
    
Don't forget to edit the `mc-config.cfg` to meet your setup. The scripts won't work correctly if you don't customize the config file first.

Starting the Server
-------------------
Most of the scripts in this repo require Minecraft to run inside a GNU screen. This can be done using the `mc-start.sh` script as follows:

    ./mc-start.sh

Stopping the Server
-------------------
You can shut down the server (and give people a heads up) using the provided script.

    ./mc-stop.sh

Accessing the Console
---------------------
If you need to reach the Minecraft console, you may do so by running the following command. 

    screen -r minecraft

Notes
-----
These scripts are to help manage a [Minecraft](http://www.minecraft.net) server running on Linux. They are bash scripts; so they won't run on your Windows installation without some major refactoring. The installation also heavily relies on a working installation of [GNU Screen](http://www.gnu.org/software/screen/). 

*These scripts have not been tested with any third party servers. They may work, but your milage may vary.*

TODO
----
These are some features I may add eventually.
- Updating (`wget minecraft_server.jar`)
- Administrative interface (for starting and stopping)
- Ability to clone and run out of the box. No nother config needed.
- Add submodules for rendering and log viewers.
