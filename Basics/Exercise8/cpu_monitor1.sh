#!/bin/bash

# This script monitors CPU usage by top process and if it consumes more than 80% of CPu
# the script kills it.
#
# Usage is: cpu_monitor1.sh <INTERVAL>
# where INTERVAL is an measuring frequency.
#
# Use this sript together with infinitive_loop.sh script which should be run in background.

get_top_process ()
{
	PS=$(ps -eo pcpu,pid -o comm= | tail -n +2 | sort -k1 -n -r | head -1)
}

get_usage () 
{
	local USAGE=$(echo "$1" | awk '{ print $1 }')
	echo ${USAGE%.*}
}

get_pid ()
{
	echo "$1" | awk '{ print $2 }'
}

get_pname ()
{
	echo "$1" | awk '{ print $3}'
}

if [ -z $1 ]; then
	echo "Usage is: $0 <INTERVAL>"
	exit 1
fi

INTERVAL=$1

while sleep $INTERVAL
do
	get_top_process
	USAGE1=$(get_usage "$PS")
	PID1=$(get_pid "$PS")
	PNAME1=$(get_pname "$PS")
	if [ $USAGE1 -gt 80 ]; then
		sleep 10
		get_top_process
		USAGE2=$(get_usage "$PS")
		PID2=$(get_pid "$PS")
		PNAME2=$(get_pname "$PS")
		echo Killing process: $PNAME2 with PID = $PID2
		kill $PID2
	fi			
done
