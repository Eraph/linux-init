# linux-init
Scripts for setting up fresh installs just the way I like it.

## App Installation

### Desktop
Install essential desktop and terminal apps. Configure by editing all of the `config/apps-to-install.sh` script.

``` bash
./install-all-apps.sh
```

Runs both the `install-desktop-apps.sh` and `install-terminal-apps.sh` scripts.

#### Default Apps

- [VS Code](https://code.visualstudio.com/)
- [Trayscale](https://github.com/DeedleFake/trayscale) (Tailscale GUI)
- \+ all the apps mentioned in [Server](#default-apps-1)

### Server
Install essential terminal apps and set the default terminal to ZSH. Configure by editing the `terminalapps` and `zshplugins` arrays in `config/apps-to-install.sh`.

``` bash
./install-terminal-apps.sh
```

#### Default Apps

- [asciiquarium](https://github.com/cmatsuoka/asciiquarium)
- [bat](https://github.com/sharkdp/bat)
- [btop](https://github.com/aristocratos/btop)
- [fastfetch](https://github.com/fastfetch-cli/fastfetch)
- [zsh](https://zsh.sourceforge.io/)

#### Default Terminal Setup

- [Oh My Zsh](https://ohmyz.sh/)
- [PowerLevel10k Theme](https://github.com/romkatv/powerlevel10k)
- [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)
- [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)
- [you-should-use](https://github.com/MichaelAquilina/zsh-you-should-use)
- [copypath](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/copypath)
- [copyfile](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/copyfile)
- [dirhistory](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/dirhistory)

## Git
Set up good Git defaults by filling out the prompts.

``` bash
./setup-git.sh
```

## VS Code
Apply the VS Code settings for your user.

> Warning: will overwrite existing config

``` bash
./setup-vscode.sh
```
