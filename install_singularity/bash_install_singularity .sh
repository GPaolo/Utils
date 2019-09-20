#!/bin/bash
sudo apt-get update
sudo apt-get install -y build-essential libssl-dev uuid-dev libgpgme11-dev squashfs-tools libseccomp-dev wget pkg-config git cryptsetup-bin

# DOWNLOAD GO
GO_VERSION=1.13
OS=linux
ARCH=amd64
wget https://dl.google.com/go/go${GO_VERSION}.${OS}-${ARCH}.tar.gz
tar -C /usr/local -xzf go${GO_VERSION}.${OS}-${ARCH}.tar.gz
rm go${GO_VERSION}.${OS}-${ARCH}.tar.gz
# SETUP GO ENVIRONMENT
FILE=~/.bashrc
echo 'export GOPATH=${HOME}/go' >> ${FILE}
echo 'export PATH=/usr/local/go/bin:${PATH}:${GOPATH}/bin' >> ${FILE}
source ${FILE}

# Download Singularity
SING_VERSION=3.4.0
wget https://github.com/sylabs/singularity/releases/download/v${SING_VERSION}/singularity-${SING_VERSION}.tar.gz
tar -xzf singularity-${SING_VERSION}.tar.gz
cd singularity
# Compile Singularity
./mconfig
make -C ./builddir
sudo make -C ./builddir install

rm -r singularity
rm singularity-${SING_VERSION}.tar.gz

# Test Singularity
singularity --version
. /usr/local/etc/bash_completion.d/singularity
