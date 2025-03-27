#!/bin/sh

read -p "Your full name? " username

read -p "Your email? " email

read -p "Default Editor? (default: nano) " editor
editor="${name:=nano}"

git config --global user.name "$username"
git config --global user.email "$email"
git config --global push.default "current"
git config --global pull.rebase "false"
git config --global core.editor "$editor"
git config --global credential.helper "store"
git config --global push.autoSetupRemote "true"

echo "All done!"

git config list --global | cat
