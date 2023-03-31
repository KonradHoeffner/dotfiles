# syntax=docker/dockerfile:1
# Example for Konrads default installation with packages and dotfiles for confortable command line usage.
# Not intended to be used with Docker in production.
FROM archlinux
USER root
RUN pacman --noconfirm -Syyu sudo git ack zsh zsh-completions zsh-syntax-highlighting neovim exa bat
RUN useradd -m -G wheel -s /bin/zsh konrad && passwd -d konrad && chsh -s /bin/zsh konrad
USER konrad
WORKDIR /home/konrad
COPY --chown=root ./etc /etc
COPY --chown=konrad ./.config ./.config
COPY --chown=konrad [".zshrc", ".bashrc", ".gitconfig", ".vimrc", "."]
ENTRYPOINT /bin/zsh
