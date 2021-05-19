#!/bin/bash

apt update
apt install -y apt-utils curl git less nano software-properties-common ssh unzip wget zsh

git clone -b docker --single-branch https://github.com/AtlasRW/dotfiles.git ~/dotfiles
mv ~/dotfiles/.antigen.zsh ~/.
mv ~/dotfiles/.gitconfig ~/.
mv ~/dotfiles/.gitignore ~/.
mv ~/dotfiles/.nanorc ~/.
mv ~/dotfiles/.p10k.zsh ~/.
mv ~/dotfiles/.zshrc ~/.
mv ~/dotfiles/.git ~/.
rm -Rf ~/dotfiles

curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | bash
apt-key adv --keyserver keyserver.ubuntu.com --recv-key C99B11DEB97541F0
apt-add-repository https://cli.github.com/packages
apt update
apt install -y gh git-lfs
git lfs install

rm /etc/localtime
ln -s /usr/share/zoneinfo/Europe/Paris /etc/localtime

curl -sS https://getcomposer.org/installer -o composer-setup.php
HASH=`curl -sS https://composer.github.io/installer.sig`
php -r "if (hash_file('SHA384', 'composer-setup.php') === '$HASH') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
php composer-setup.php --install-dir=/usr/local/bin --filename=composer
rm composer-setup.php

cd ~
ln -s /var/www/html ~/apache
exec zsh
