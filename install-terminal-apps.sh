#!/bin/bash

. config/apps-to-install.sh

. helper-scripts/array-helpers.sh
. helper-scripts/install-helpers.sh

install ${terminalapps[*]// /}

if contains zsh ${terminalapps[@]}; then
    ./setup-zsh.sh
fi