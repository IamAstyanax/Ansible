# Docker devops deploy for ansible (as of oct 1 2020) on CentOS 7

#update 
yum update
#update epel release
yum -y install epel-release

#installs py lang, node, yum-utils, etc
yum -y install git gcc gcc-c++ lvm2 bzip2 gettext nodejs yum-utils device-mapper-persistent-data ansible python-pip

#docker modification
yum -y remove docker docker-common docker-selinux docker-engine

#add repo 
yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo

#install docker ce
yum -y install docker-ce

#install pip / dockerpy
pip install -U docker-py

#clone awx repo

git clone --depth 50 https://github.com/ansible/awx.git

# install pip3
yum install python3 python36-docker -y

#to show docker-py version
pip show docker-py

cd awx/installer/

grep -v '^ *#' inventory | sed '/^$/d'

#deploy 
pip3 install docker-compose
 ansible-playbook -i inventory install.yml
 systemctl start docker

 #install ansible galaxy
 ansible-galaxy collection install chocolatey.chocolatey
 