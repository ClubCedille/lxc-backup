#!/bin/bash
#########################
# NAME : backup.sh
# AUTHOR : Nicolas De Oliveira Nadeau
# DESCRIPT : Snapshot all active container every days
#

# Get the vm list
vms="$(lxc-ls --active)"

# Backup Container
backup(){
  local vm="$1"
  printf "\n############ %s will be stop ############\n" "$vm"
  lxc-stop -n $vm
  printf "\n############ %s will be snap ############\n" "$vm"
  lxc-snapshot -n $vm
  printf "\n############ %s will be start ###########\n" "$vm"
  lxc-start -d -n $vm
}

for v in $vms
do
   update_vm "$v"
done
