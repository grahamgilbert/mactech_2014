#!/bin/bash

if ( /usr/bin/profiles -P | /usr/bin/grep -q 'com.pebbleit.myprofile' ); then
    # Profile is present
    exit 1
else
    # Profile isn't there, need to install
    exit 0
fi