#!/bin/sh

# Get some parameters
echo "Enter domain:"
read domainName
echo "Enter domain admin:"
read domainUser
echo "Enter name of domain admin group"
read adminGroup

# Join to domain
sudo yum install -y realmd samba samba-common oddjob oddjob-mkhomedir sssd
sudo realm join --user=$domainUser@$domainName $domainName 

# Adjust sudoers file for domain admin group 

if [ -z "$1" ] ; then
  export EDITOR=$0 && sudo -E visudo
else
  echo "%$adminGroup@$domainName      ALL=(ALL)       ALL" >> $1
fi

# Setup sshd

# Setup docker & docker-compose

# Setup docker-compose cms
