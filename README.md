# Konrads dotfiles

Easy set up for new Arch Linux systems to conform to my preferences or for others to pick favourite bits, see the Dockerfile for a live demo.
Also useful for Ubuntu.

* .zshrc references https://github.com/zsh-users/zsh-syntax-highlighting

## Favourite Packages

* `git`
* `docker`
* `paru` replaces `pacman` on Arch Linux
* `zsh` replaces `bash`
* `nvim` replaces `vim`
* `exa` replaces `ls`
* `bat` replaces `cat`

### Installation on Arch Linux

	cd /tmp
	wget https://aur.archlinux.org/cgit/aur.git/snapshot/paru.tar.gz
	tar -xzf paru.tar.gz
	cd paru
	makepkg -si
	paru -S git zsh zsh-completions zsh-syntax-highlighting neovim exa bat docker

### Setup

	chsh -s /usr/bin/zsh
    mkdir -p .config
    git clone git@github.com:konradhoeffner/dotfiles
	cd dotfiles
    cp .ackrc .bashrc .gitconfig .vimrc .zshrc ..
    cp -r .config/bat .config/nvim ../.config
	systemctl enable docker --now

Consider running [Docker as non-root user](https://docs.docker.com/engine/install/linux-postinstall/#manage-docker-as-a-non-root-user) or [in rootless mode (safer)](https://docs.docker.com/engine/security/rootless/).
On a server, change the precmd line in `.zshrc` to `precmd () { print -Pn "\e]2;$USER@$HOST %~\a" }` to prevent mixups.

### Ubuntu

    apt-get install git zsh zsh-syntax-highlighting neovim exa bat

Change `/usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh` to `/usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh` in ~/.zshrc.
Follow the [Docker Ubuntu installation manual](https://docs.docker.com/engine/install/ubuntu/).
