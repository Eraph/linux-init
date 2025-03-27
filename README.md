# linux-init
Scripts for setting up fresh installs just the way I like it.

## App Installation

### Desktop
Install essential desktop and terminal apps.

``` bash
./install-full-desktop.sh
```

Runs both the `install-desktop-apps.sh` and `install-terminal-apps.sh` scripts.

Installs the following apps:

- [VS Code](https://code.visualstudio.com/)
- [Trayscale](https://github.com/DeedleFake/trayscale) (Tailscale GUI)
- \+ all the apps mentioned below

### Server
Install essential terminal apps and set the default terminal to ZSH.

``` bash
./install-terminal-apps.sh
```

Installs the following apps:

- [asciiquarium](https://github.com/cmatsuoka/asciiquarium)
- [bat](https://github.com/sharkdp/bat)
- [btop](https://github.com/aristocratos/btop)
- [fastfetch](https://github.com/fastfetch-cli/fastfetch)
- [zsh](https://zsh.sourceforge.io/)

Also sets up ZSH with [Oh My Zsh](https://ohmyz.sh/) and the [PowerLevel10k](https://github.com/romkatv/powerlevel10k) theme, along with the following plugins:

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
Set the VS Code settings for your user.

> Warning: will overwrite existing config

``` bash
./setup-vscode.sh
```


## Misc
The `_install.sh` file is a helper for installing apps across different distros.