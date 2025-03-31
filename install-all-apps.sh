#!/bin/bash

if [[ $(/usr/bin/id -u) -ne 0 ]]; then
    echo "This script should be run as root"
    exit
fi

./install-desktop-apps.sh
./install-terminal-apps.sh