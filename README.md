# Konrads dotfiles

Easy set up for new Arch Linux systems to conform to my preferences or for others to pick favourite bits, see the Dockerfile for a live demo.
Also useful for Ubuntu.

* .zshrc references https://github.com/zsh-users/zsh-syntax-highlighting

## Favourite Packages

* `git`
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
	paru -S git zsh zsh-completions zsh-syntax-highlighting neovim exa bat

### Installation on Ubuntu

    apt-get install git zsh zsh-syntax-highlighting neovim exa bat
