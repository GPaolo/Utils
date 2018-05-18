#!/bin/bash

set -eu -o pipefail # fail on error , debug all lines

echo installing the must-have pre-requisites
while read -r p ; do apt-get install -y $p ; done < <(cat << "EOF"
    git
    wget
    zsh
    nano
    python3
    python3-pip 
    python3-dev
EOF
)
# Make zsh default
chsh -s $(which zsh)

# Create src folder to download stuff
mkdir ./src
cd src

# Install pip and packages for virtualenv
wget https://bootstrap.pypa.io/get-pip.py
python3 get-pip.py
pip install pipenv

# Install oh-my-zsh and make it default
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
export PIPENV_VENV_IN_PROJECT=1
export SHELL=zsh