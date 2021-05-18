#!/bin/bash

apt update
apt install -y apt-utils curl git less nano software-properties-common ssh unzip wget zsh

git clone https://github.com/AtlasRW/dotfiles.git /root/dotfiles
mv /root/dotfiles/.antigen.zsh /root/.
mv /root/dotfiles/.gitconfig /root/.
mv /root/dotfiles/.gitignore /root/.
mv /root/dotfiles/.nanorc /root/.
mv /root/dotfiles/.p10k.zsh /root/.
mv /root/dotfiles/.zshrc /root/.
mv /root/dotfiles/.git /root/.
rm -rf /root/dotfiles

cd ~