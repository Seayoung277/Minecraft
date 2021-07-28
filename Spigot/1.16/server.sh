#!/bin/bash

pid=`pidof java`
now=`date +"%H:%M"`

if [[ -z "$pid" ]] ; then
    echo "Server is down, restarting server ..."
    screen -dmS mc bash start.sh
elif [[ "03:00" == $now ]] ; then
    echo "3AM now, restarting server ..."
    screen -S mc -X stuff 'stop\n'
    screen -dmS mc mkdir ./save/$(date +'%m_%d_%Y')
    screen -dmS mc cp -r world* ./save/$(date +'%m_%d_%Y')
    screen -dmS mc bash start.sh
elif [[ "15:00" == $now ]] ; then
    echo "3PM now, restarting server ..."
    screen -S mc -X stuff 'stop\n'
    screen -dmS mc bash start.sh
else
    echo "Server is running, nothing to do"
fi
