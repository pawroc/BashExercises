#!/bin/bash
# In order to start this script after logging by a specific user, type in console:
# "useradd -s /path/to/script <USERNAME>". The script should be copied into 
# /usr/local/bin directory.

while true; do
	trap "echo Sorry, You should logout first" INT
	
	pinghost ()
	{
		echo Which host do want to ping?
		read HOSTNAME
		ping -c 1 $HOSTNAME
	}

	echo 'Select option: '
	select TASK in 'Reset password' 'Show disc usage' 'Ping a host' 'Log out'
	do
		case $REPLY in 
			1 ) TASK=passwd;;
			2 ) TASK="df -h";;
			3 ) TASK=pinghost;;
			4 ) TASK=exit;;
			* ) echo ERROR && exit 2
		esac
		if [ -n "$TASK" ]; then
			$TASK
			break
		else
			echo Not known answer && exit 3
		fi
	done	
done
exit 0
