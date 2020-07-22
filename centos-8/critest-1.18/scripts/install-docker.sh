#!/usr/bin/env bash
dnf -y config-manager --add-repo=https://download.docker.com/linux/centos/docker-ce.repo
sed -i '/^gpgkey=https:\/\/download.docker.com\/linux\/centos\/gpg/a module_hotfixes=True' /etc/yum.repos.d/docker-ce.repo
dnf -y install --nobest \
    containerd.io-1.2.13-3.2.el7 \
    docker-ce-19.03.12-3.el7 \
    docker-ce-cli-19.03.12-3.el7

# enable cri by default (containerd installed by docker disables cri via config)
truncate --reference /dev/null /etc/containerd/config.toml

# configure dockerd
mkdir -p /etc/docker
cat > /etc/docker/daemon.json << EOF
{
  "log-driver": "json-file",
  "log-opts": {
    "max-size": "100m"
  },
  "selinux-enabled": true,
  "storage-driver": "overlay2",
  "storage-opts": [
    "overlay2.override_kernel_check=true"
  ]
}
EOF
# disable dockerd
systemctl daemon-reload
systemctl disable --now docker
# enable sudo-less docker for vagrant user
usermod -aG docker vagrant
