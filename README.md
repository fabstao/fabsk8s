# Fabs Kubernetes Installer - Ansible based
--------------------

AIO Kubernetes installer (say no to minikube) which can be deployed on bare metal or VMs. 

## Supported platforms:

* Debian based
* RPM based (Fedora, CentOS, etc)
* Calico CNI

## Tested platforms:

* Fedora 32
* Debian 

## Usage:

### Prerequisites

* Ansible 2.9
* Debian or Fedora32 host with minimum 7 GB of RAM, 3 vCPUs and 25 GB od free disk for AIO demo
* bash
* ssh key pair already installed on the AIO host
* sudo passwordless on the AIO host (similar to cloud instances like in AWS or Openstack)
* kubectl client installed on Ansible controller
* On Fedora 32 systems, add: `systemd.unified_cgroup_hierarchy=0` to GRUB_CMDLINE_LINUX in /etc/default/grub

### Steps

1. Clone this repo
2. Edit the hosts inventory file, follow the template (specify private key file, desired hostname and IP address of the cluster interface)
3. Execute: `ansible-playbook -i hosts install.yaml`
4. Retrieve kubeconfig from AIO host to your $HOME/.kube folder as per kubernetes.io instructions
5. (Optional) Execute `deployDashboard.sh` and use the printed token to access Kubernetes UI dashboard

## TODO

* Add dashboard deployment
* Add ingress
* Test multi node cluster deployment
* Formal Documentation

### Author

(C) 2020 Fabian Salamanca <fabs@koalatechie.com>

