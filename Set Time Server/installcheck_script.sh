#!/bin/bash

TIMESERVER=`/usr/sbin/systemsetup -getnetworktimeserver`
USINGNETWORK=`/usr/sbin/systemsetup -getusingnetworktime`

if [ "$TIMESERVER" == "Network Time Server: ntp.company.com" ]; then
    if [ "$USINGNETWORK" == "Network Time: On" ]; then
        exit 1
    else
        exit 0
    fi
else
    exit 0
fi
