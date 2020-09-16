# k3s on CentOS 7

Spin up a small k3s cluster on centos 7 and test upgrades via SUC.

## Usage

- `vagrant up`
  (wait for the cluster to get to steady-state)
- `vagrant up kay-three-ess-1 --provision-with=install-suc`
  (wait for the system-upgrade-controller pod to be running)
- `vagrant up kay-three-ess-1 --provision-with=install-plans`
- `vagrant ssh kay-three-ess-1`
  - `kubectl label node --all k3s-upgrade=true` (start the upgrade)
  - `watch kubectl get node,service,daemonset,deployment,job,pod -A -o wide` (watch the upgrade roll)