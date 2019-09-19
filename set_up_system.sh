#!/bin/bash

#set -eu -o pipefail # fail on error , debug all lines

echo installing the must-have pre-requisites
apt-get update
apt-get install -y git wget zsh nano python3 python3-pip python3-dev tmux htop
# Make zsh default
chsh -s $(which zsh)

# Create src folder to download stuff
sudo -u $USER mkdir -p ./src
sudo -u $USER cd src

# Install pip and packages for virtualenv
sudo -u $USER wget https://bootstrap.pypa.io/get-pip.py
sudo -u $USER python3 get-pip.py
sudo -u $USER pip install pipenv

# Install oh-my-zsh and make it default
sudo -u $USER sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

sudo -u $USER echo "export PIPENV_VENV_IN_PROJECT=1" >> ~/.zshrc
sudo -u $USER echo "export SHELL=/usr/bin/zsh" >> ~/.zshrc
sudo -u $USER echo "export LC_ALL=C.UTF-8" >> ~/.zshrc
sudo -u $USER echo "export LANG=C.UTF-8" >> ~/.zshrc

# Create tmux conf
sudo -u $USER tmux
sudo -u $USER tmux show -g | sed 's/^/set -g /' > ~/.tmux.conf
