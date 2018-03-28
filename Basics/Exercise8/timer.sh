#!/bin/bash

# This script counts down from given time (in minutes) and when is counts to zero then it starts to count up. 
# It is intended to display on the screen the time left to accomplish some task and then display how much time 
# we are late with the task.
#
# Usage:
# ./timer.sh <TIME_IN_MINUTES>

MINUTES=$1
SEC=0

count_down()
{	 
	if [ $SEC -eq 0 ]; then
		MINUTES=$(( MINUTES - 1 ))
		SEC=60
	fi
	SEC=$(( SEC - 1 ))
	sleep 1
}

count_up()
{
	if [ $SEC -eq 59 ]; then
		MINUTES=$(( MINUTES + 1 ))
		SEC=-1
	fi
	SEC=$(( SEC + 1 ))
	sleep 1
}

display_left_time()
{
	printf '%-14s %-2s %-11s %-2s %-10s\n' "You have still" "$MINUTES" "minutes and" "$SEC" "seconds..."
}

display_late_time()
{
	printf '%-14s %-2s %-11s %-2s %-10s\n'  "You are late" "$MINUTES" "minutes and" "$SEC" "seconds"	
}

while [ $MINUTES -ge 0  ]; do
	display_left_time
	count_down
done

echo Time passed!
SEC=1
MINUTES=0

while true; do
	display_late_time
	count_up
done

