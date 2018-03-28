#!/bin/bash
#
# Define the network that is tested

echo On what network do you want to test? \(Please enter a 4 byte number\)
echo Press enter if you want to scan the local network
read NETWORK
[ -z $NETWORK ] && NETWORK=`ip a s | grep enp0s3 | head -n 3 | tail -n 1 | awk '{print $2 }'` && \
	NETWORK=${NETWORK%/*}
NETWORK=${NETWORK%.*}

# Remove old uplist file if existing
rm /tmp/uplist

# Run the program
for (( NODE=1; NODE<20; NODE++ )); do
	if ping -c 1 $NETWORK.$NODE
	then
		echo $NETWORK.$NODE >> /tmp/uplist
	fi
done

echo press enter to display the list
read

cat /tmp/uplist
exit 0
