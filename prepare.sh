#!/bin/bash

set -e

# concatenate ZIP archive
cat *-vm.z* > cat.zip

# unzip it
unzip cat.zip || :
rm -rf cat.zip

# Import OVA in VirtualBox
vboxmanage import ./gips-ova/gips.ova --vsys 0 --eula accept
rm -rf ./gips-ova

# Get VM ID
raw_id=$(vboxmanage list vms)
id=$(echo $raw_id | awk -F[{}] '{print $2}')

# Package the VM as Vagrant box
vagrant package --base $id --output gips.box

# Add box as local Vagrant box
vagrant box add gips.box --name gips
