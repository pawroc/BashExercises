#!/bin/bash

#USER=$(cat text | tr [A-Z] [a-z] | cut -f 1 -d , | cut -f 2 -d =)
USER="cn=lara,dc=example,dc=com"
USER=${USER%%,*}
USER=${USER##*=}
USER=$(echo $USER | tr [:upper:] [:lower:])
echo the user is $USER

exit 0
