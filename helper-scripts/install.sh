#!/bin/bash

if [[ $(/usr/bin/id -u) -ne 0 ]]; then
    echo "This script should be run as root"
    exit
fi

# Helper script for handling multiple OS's

echo Installing the following apps: $@

if [ -x "$(command -v apk)" ];
then
    apk add --no-cache -y $@
elif [ -x "$(command -v apt-get)" ];
then
    apt-get install -y $@
elif [ -x "$(command -v dnf)" ];
then
    dnf check-update
    dnf install -y $@
elif [ -x "$(command -v zypper)" ];
then
    zypper install -y $@
else
    echo "FAILED TO INSTALL PACKAGE: Package manager not found. You must manually install: $@">&2;
fi