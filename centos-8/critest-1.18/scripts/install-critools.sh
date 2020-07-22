#!/usr/bin/env bash
if [ ! -d /usr/src/github.com/kubernetes-sigs/cri-tools ]; then
  git clone https://github.com/kubernetes-sigs/cri-tools.git /usr/src/github.com/kubernetes-sigs/cri-tools
fi
pushd /usr/src/github.com/kubernetes-sigs/cri-tools
make GOPATH=/usr
make BINDIR=/usr/bin install
