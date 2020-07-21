#!/usr/bin/env bash
if [ ! -d $HOME/go/src/github.com/kubernetes-sigs/cri-tools ]; then
  git clone https://github.com/kubernetes-sigs/cri-tools.git $HOME/go/src/github.com/kubernetes-sigs/cri-tools
fi
pushd $HOME/go/src/github.com/kubernetes-sigs/cri-tools
make
make BINDIR=/usr/bin install
