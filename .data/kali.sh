#!/bin/bash

source /root/.data/_config.sh
source /root/.data/_localtime.sh

apt update
apt install kali-tools-top10 -y

exec zsh