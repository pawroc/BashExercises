#!/bin/bash

# This script represents to approches to use if-elif-fi conditional statements.
# The first way is to use directly if-elif-fi statement and the second one 
# represents [ condition ] && then statements.
#
# Except of these two ways you can find here different important and very common
# checking statements used in scripting. 
#
# Usage:
# ./if-fi.sh <path/to/FILE_OR_DIRECTORY>

if [ -z $1 ]
then
	echo no argument provided
	exit 1
elif [ ! -e $1 ]
then
	echo $1 does not exist
	exit 2
elif [ -d $1 ]
then
	echo $1 is a directory
elif [ ! -f $1 ]
then
	echo $1 is not a directory and not a file
elif [ -x $1 ]
then
	echo $1 is an executable file
elif grep '#!/bin/bash' $1 1>/dev/null
then
	echo $1 is a non-executable bash script
	echo chmod +x $1
else
	echo I don\'t know what this is
fi

###############
#

[ -z $1 ] && echo no argument provided $$ exit 1
[ ! -e $1 ] && echo $1 does not exist $$ exit 2
[ -d $1 ] && echo $1 is a directory && exit
[ ! -f $1 ] && echo $1 is not a directory and not a file && exit
[ -x $1 ] && echo $1 is an executable file && exit
grep '#!/bin/bash' $1 && echo $1 is a non-executable shell script && echo chmod +x $1 && exit
echo I don\'t know what thi is
