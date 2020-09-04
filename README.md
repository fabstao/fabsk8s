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
* Debian or Fedora32 host with minimum 8 GB of RAM, 3 vCPUs and 25 GB od free disk for AIO demo
* bash
* ssh key pair already installed on the AIO host
* sudo passwordless on the AIO host (similar to cloud instances like in AWS or Openstack)
* kubectl client installed on Ansible controller

### Steps

1. Clone this repo
2. Edit the hosts inventory file, follow the template (specify private key file, desired hostname and IP address of the cluster interface)
3. On Fedora systems execute: `ansible-playbook -i hosts prerpm.yaml`
4. Execute: `ansible-playbook -i hosts install.yaml`
5. Playbook will retrieve kubeconfig file to current directory, you should have a matching version installation of kubectl client
6. (Optional) Execute `deployDashboard.sh` and use the printed token to access Kubernetes UI dashboard
6. (Optional) Execute `deployNginxIngress.sh` and use NGINX based Ingress with NodePort (bare metal style)

## TODO

* Implement multi node cluster deployment
* Formal Documentation

### Author

(C) 2020 Fabian Salamanca <fabs@koalatechie.com>

