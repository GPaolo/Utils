#!/bin/bash

#set -eu -o pipefail # fail on error , debug all lines

echo installing the must-have pre-requisites
sudo apt-get update
sudo apt-get install -y git wget zsh nano python3 python3-pip python3-dev tmux htop
# Make zsh default
sudo chsh -s $(which zsh)

# Create src folder to download stuff
mkdir -p ./src
cd src

# Install pip and packages for virtualenv
wget https://bootstrap.pypa.io/get-pip.py
python3 get-pip.py
pip install pipenv

# Install oh-my-zsh and make it default
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

echo "export PIPENV_VENV_IN_PROJECT=1" >> ~/.zshrc
echo "export SHELL=/usr/bin/zsh" >> ~/.zshrc
echo "export LC_ALL=C.UTF-8" >> ~/.zshrc
echo "export LANG=C.UTF-8" >> ~/.zshrc

# Create tmux conf
tmux
cp ./.tmux.conf ~/.tmux.conf
