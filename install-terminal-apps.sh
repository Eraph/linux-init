#!/bin/bash

. config/apps-to-install.sh

. helper-scripts/array-helpers.sh
. helper-scripts/install-helpers.sh

install ${terminalapps[*]// /}

if contains zsh ${terminalapps[@]}; then
    echo Setting ZSH as default shell
    chsh -s $(which zsh)

    echo Installing Oh My Zsh
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

    echo Installing PowerLevel10k
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

    echo Setting OMZ theme
    sed -i 's/^ZSH_THEME="\S*"$/ZSH_THEME="powerlevel10k\/powerlevel10k"/' ~/.zshrc

    if [[ -n ${zshplugins[@]} ]]; then
        echo Installing plugins
        if contains zsh-autosuggestions ${zshplugins[@]}; then
            git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
        fi
        if contains zsh-syntax-highlighting ${zshplugins[@]}; then
            git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
        fi
        if contains you-should-use ${zshplugins[@]}; then
            git clone https://github.com/MichaelAquilina/zsh-you-should-use.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/you-should-use
        fi

        sed -ri "s/^plugins=\(([[:print:]]*)\)$/plugins=(\1 ${zshplugins[*]// /})/g" ~/.zshrc
    fi

    # Start using zsh
    zsh
fi