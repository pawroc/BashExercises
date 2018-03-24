#!/bin/bash

if [ -z $1 ]; then
    read -p "Enter files to be moved do \\home direcotry: " PATHS
else
    PATHS="$@"
fi

for FILE in $PATHS; do
    if [ ! -f $FILE ]; then
        echo "The file \"$FILE\" does not exist. It is ommited."
	continue
    fi
    cp $FILE $HOME
    if [ $? -eq 0 ]; then echo "File \"$FILE\" moved to \\home directory."; fi
done

exit 0