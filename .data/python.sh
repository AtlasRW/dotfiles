#!/bin/bash

source /root/.data/_config.sh
source /root/.data/_localtime.sh
source /root/.data/_git.sh

curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | python -
echo -e "\n\nsource $HOME/.poetry/env" >> /root/.zshrc
source $HOME/.poetry/env

exec zsh