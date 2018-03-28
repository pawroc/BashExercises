#!/bin/bash

erroneous ()
{
	echo This line prints a value of a variable that does not exist. The value is: $VALUE_WHICH_DOES_NOT_EXIST
}

trap DEBUG

echo This line is OK...just before erroneous function...
erroneous

trap - DEBUG

echo This line is correct

exit 0
