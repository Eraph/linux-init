#!/bin/bash

. config/apps-to-install.sh

. helper-scripts/array-helpers.sh
. helper-scripts/install-helpers.sh

if contains code ${desktopapps[@]}; then
    # VS Code
    echo Preparing to install VS Code

    # Add other distro specific business as needed following the pattern in install-helpers.sh
    if [ -x "$(command -v dnf)" ];
    then
        ## Fedora
        sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
        echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\nautorefresh=1\ntype=rpm-md\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" | sudo tee /etc/yum.repos.d/vscode.repo > /dev/null
    else
        echo "This script doesn't support the package manager for this system!">&2;
    fi
fi

install ${desktopapps[*]// /}
