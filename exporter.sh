#!/bin/bash
#########################
# NAME : exporter.sh
# AUTHOR : Nicolas De Oliveira Nadeau
# DESCRIPT : Compress and export all snapshot every week
#

# Get the vm list
vms="$(lxc-ls --active)"
snapsFolder="/var/lib/lxcsnaps"
# Export Container
exporter(){
  local vm="$1"
  now=date '+%F'
  cn="$vm.$now.tar.gz"

  # Compress
  tar czf $cn $snapsFolder/$vm

  # RSYNC VS SCP VS FTP

  # DELETE ALL SNAPSHOT
  rm -rf /var/lib/lxcsnaps/$vm

}

for v in $vms
do
   exporter "$v"
done
