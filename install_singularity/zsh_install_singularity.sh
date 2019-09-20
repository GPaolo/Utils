#!/bin/zsh
apt-get update
apt-get install -y build-essential libssl-dev uuid-dev libgpgme11-dev squashfs-tools libseccomp-dev wget pkg-config git cryptsetup-bin

# DOWNLOAD GO
GO_VERSION=1.13
OS=linux
ARCH=amd64
sudo -u $USER wget https://dl.google.com/go/go${GO_VERSION}.${OS}-${ARCH}.tar.gz
tar -C /usr/local -xzf go${GO_VERSION}.${OS}-${ARCH}.tar.gz
sudo -u $USER rm go${GO_VERSION}.${OS}-${ARCH}.tar.gz
# SETUP GO ENVIRONMENT
FILE=~/.zshrc
sudo -u $USER echo 'export GOPATH=${HOME}/go' >> ${FILE}
sudo -u $USER echo 'export PATH=/usr/local/go/bin:${PATH}:${GOPATH}/bin' >> ${FILE}
sudo -u $USER source ${FILE}

# Download Singularity
SING_VERSION=3.4.0
sudo -u $USER wget https://github.com/sylabs/singularity/releases/download/v${SING_VERSION}/singularity-${SING_VERSION}.tar.gz
sudo -u $USER tar -xzf singularity-${SING_VERSION}.tar.gz
sudo -u $USER singularity
# Compile Singularity
sudo -u $USER ./mconfig
sudo -u $USER make -C ./builddir
make -C ./builddir install

# Test Singularity
sudo -u $USER singularity --version
