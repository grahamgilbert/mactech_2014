#!/bin/bash

# The version of the package
PKG_VERSION="1.0.0"

# The identifier of the package
PKG_ID="com.pebbleit.myprofile"

# The identifier of the profile
PROFILE_ID="com.pebbleit.myprofile"

##############
# STOP EDITING
##############

# The version installed from pkgutil
VERSION_INSTALLED=`/usr/sbin/pkgutil --pkg-info ${PKG_ID} | grep version | sed 's/^[^:]*: //'`

if ( /usr/bin/profiles -P | /usr/bin/grep -q $PROFILE_ID ); then
    # Profile is present, check the version
    if [ "$VERSION_INSTALLED" = "$PKG_VERSION" ]; then
        # Correct version, all good
        exit 1
    else
        exit 0
    fi
else
    # Profile isn't there, need to install
    exit 0
fi