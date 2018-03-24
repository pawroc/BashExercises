#!/bin/bash

DATE=$(date +%d-%m-%y)

echo "The date is $DATE"
echo The day is ${DATE%%-*}
MONTH=${DATE%-*}
echo The month is ${MONTH#*-}
echo The year is ${DATE##*-}

exit 0
