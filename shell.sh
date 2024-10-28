#!/bin/sh

echo Installing ZSH
sudo zypper install -y zsh

echo Setting ZSH as default shell
chsh -s $(which zsh)

echo Installing Oh My Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

echo Installing NerdFonts
#git clone --depth 1 https://github.com/ryanoasis/nerd-fonts.git
#./nerd-fonts/install.sh Meslo

curl -OL https://github.com/ryanoasis/nerd-fonts/releases/latest/download/Meslo.tar.xz
tar -xf Meslo.tar.xz -C ~/.local/share/fonts

#echo Setting font in Gnome Terminal
#gconftool-2 --set /apps/gnome-terminal/profiles/Default/font --type string "Meslo"

echo Installing PowerLevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k


echo Setting OMZ theme
sed -i 's/^ZSH_THEME="\S*"$/ZSH_THEME="powerlevel10k\/powerlevel10k"/' ~/.zshrc

echo Installing ZSH syntax highlighting and autosuggestions
sudo zypper addrepo https://download.opensuse.org/repositories/shells:zsh-users:zsh-syntax-highlighting/openSUSE_Tumbleweed/shells:zsh-users:zsh-syntax-highlighting.repo
sudo zypper addrepo https://download.opensuse.org/repositories/shells:zsh-users:zsh-autosuggestions/openSUSE_Tumbleweed/shells:zsh-users:zsh-autosuggestions.repo
sudo zypper refresh
sudo zypper install -y zsh-syntax-highlighting zsh-autosuggestions

echo "source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ~/.zshrc
echo "source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh" >> ~/.zshrc

# Tidying up...
rm Meslo.tar.xz

# Start using zsh
zsh
