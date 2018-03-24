# Description
This script shows how to use _select_ bash bilt-in command to create a menu. 
The intention of this script is to run it when a specific user loggs in. 
There shouldn't be an option to kill this scritp by __CTR + C__. There should
be only one way to logout - by one of the menu option.

## Usage
In order to stick some script to a specific user and run it automaticly when
user loggs in, we can copy the srcipt to the _/usr/local/bin_ directory.
Thereafter, we should create a user with a specific _shell_. We can acomplish it
tyoing the command _useradd -s /usr/local/bin/<SCRIPT>_
