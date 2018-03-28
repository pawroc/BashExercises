#!/bin/bash

BLAH=rababarabarabarara
clear

echo BLAH is $BLAH
echo 'the result of ##*ba is ' ${BLAH##*ba}
echo 'the result of #*ba is ' ${BLAH#*ba}
echo 'the result of %%ba* is ' ${BLAH%%ba*}
echo 'the result of %ba* is ' ${BLAH%ba*}

exit 0
