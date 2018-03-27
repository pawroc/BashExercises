#!/bin/bash

# This is an easy game consisting in guessing the result of math expression.
# The game runs until you miss the result. You can set different difficulty level
# from 1 to 10 (by default is set to 5).
#
# Usage:
# ./math_game.sh <LEVEL>
# LEVEL is a difficulty level from 1 to 10 (by default 5)

if [ $# -gt 1 ]; then
	echo "Usage is:"
	echo "./math_game.sh <LEVEL>"
	echo "LEVEL is a difficulty level from 1 to 10 (by default 5)"
	exit 1
fi

bold=$(tput bold)
normal=$(tput sgr0)

numbers='^-?[0-9]+([.][0-9]+)?$'

start_game ()
{
	startup_screen
	points=0
	level=50
	if [ -z $1 ]; then
		level=50
	elif [ "$1" -le 10 ]; then
		level=$(expr $1 \* 10)
	else
		level=100
	fi
}

startup_screen ()
{
	echo "${bold}"
	echo "*******************************"
	echo "*          Math Game          *"
	echo "*          Welcome!           *"
	echo "*******************************"	
	echo "${normal}"
}

game_over ()
{
	printf "${bold}"
	echo "***********************************************"
	echo "*                GAME OVER!                   *"
	printf '%-12s %-4s %-29s\n' "*   You got " "$points" " points. Congratulations!   *"
	echo "***********************************************"
	printf "${normal}"
}

get_numbers ()
{
	x=$(expr $RANDOM % $level)
	y=$(expr $RANDOM % $level)
	result=$(expr $x \* $y)	
}

get_and_check_answer ()
{
	echo "$x * $y = $result"
	read -p ""$x" * "$y" = " answer
}

#########################################
# GAME

start_game $1

while true; do
	get_numbers

	get_and_check_answer
	while ! [[ $answer =~ $numbers ]] ; do
		echo "Enter a number, please..."
	   	get_and_check_answer
	done

	if [ "$answer" -ne "$result" ]; then
		game_over
		exit 0
	fi

	points=$(expr $points + 1)
done


