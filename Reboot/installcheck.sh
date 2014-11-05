#!/bin/bash

days=`uptime | awk '{ print $4 }' | sed 's/,//g'`
num=`uptime | awk '{ print $3 }'`

# now check how long they've been awake
if [ $days = "days" ]; then
# Change the number below to check for a different number of days
    if [ $num -gt "7" ]; then
        exit 0
    else
        exit 1
    fi
else
    exit 1
fi