#!/usr/bin/env bash
yum -y install container-selinux selinux-policy-base \
    https://rpm.rancher.io/k3s-selinux-0.1.1-rc1.el7.noarch.rpm
curl -fsSL https://get.k3s.io | env \
    INSTALL_K3S_BIN_DIR=/usr/bin \
    INSTALL_K3S_SKIP_ENABLE=true \
    INSTALL_K3S_EXEC="--disable=coredns,local-storage,metrics-server,servicelb,traefik" \
  sh -
