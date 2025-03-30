#!/bin/sh

./config/apps-to-install.sh

./helper-scripts/install.sh ${terminalapps[*]// /}

echo Setting ZSH as default shell
chsh -s $(which zsh)

echo Installing Oh My Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

echo Installing PowerLevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

echo Setting OMZ theme
sed -i 's/^ZSH_THEME="\S*"$/ZSH_THEME="powerlevel10k\/powerlevel10k"/' ~/.zshrc

echo Installing plugins
git clone https://github.com/MichaelAquilina/zsh-you-should-use.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/you-should-use

sed -ri "s/^plugins=\(([[:print:]]*)\)$/plugins=(\1 ${zshplugins[*]// /})/g" ~/.zshrc

echo "source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh" >> ~/.zshrc
echo "source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ~/.zshrc

# Start using zsh
zsh