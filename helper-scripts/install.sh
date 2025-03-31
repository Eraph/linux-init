#!/bin/bash

# Helper script for handling multiple OS's

echo Installing the following apps: $@

if [ -x "$(command -v apk)" ];
then
    sudo apk add --no-cache -y $@
elif [ -x "$(command -v apt-get)" ];
then
    sudo apt-get update
    sudo apt-get install -y $@
elif [ -x "$(command -v dnf)" ];
then
    sudo dnf check-update
    sudo dnf install -y $@
elif [ -x "$(command -v zypper)" ];
then
    sudo zypper install -y $@
else
    echo "FAILED TO INSTALL PACKAGE: Package manager not found. You must manually install: $@">&2;
fi