#!/bin/bash

[ -f new-users ] && rm new-users

USERS=$(cat ldapusers)

for i in $USERS
do
	USER=${i%%,*}
	USER=${USER##*=}
	echo $USER >> new-users
done

for j in $(cat new-users)
do
	echo useradd $j
done

