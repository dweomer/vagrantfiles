#!/usr/bin/env bash
dnf -y install 'dnf-command(copr)'
dnf -y copr enable rhcontainerbot/container-selinux
VERSION=1.18
curl -fsSL -o /etc/yum.repos.d/devel:kubic:libcontainers:stable.repo \
    https://download.opensuse.org/repositories/devel:kubic:libcontainers:stable/CentOS_8/devel:kubic:libcontainers:stable.repo
curl -fsSL -o /etc/yum.repos.d/devel:kubic:libcontainers:stable:cri-o:${VERSION}.repo \
    https://download.opensuse.org/repositories/devel:kubic:libcontainers:stable:cri-o:${VERSION}/CentOS_8/devel:kubic:libcontainers:stable:cri-o:${VERSION}.repo
yum -y install cri-o
ln -nfsv /usr/bin/conmon /usr/libexec/crio/
