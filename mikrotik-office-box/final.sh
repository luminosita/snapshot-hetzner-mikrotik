#!/bin/bash
usage() { echo "Usage: $0 -c ip_cidr";  echo "Example: $0 -c 192.168.1.88" 1>&2; return; }

while getopts ":c:" o; do
    case "${o}" in
        c)
            ip_cidr=${OPTARG}
            ;;
        *)
            usage

            return
            ;;
    esac
done
shift $((OPTIND-1))

if [ -z "${ip_cidr}" ]; then
    usage

    return
fi

CHR_IP=$ip_cidr
TEMP_PASS="laptop01"

#echo "Waiting on VM network to start ..."
#sleep 10
#ping -t 30 -c 10 $CHR_IP

#Approve licence and set temp password
#ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null admin@$CHR_IP

echo "Coping scripts to Mikrotik VM ..."
sshpass -p $TEMP_PASS scp -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null rsc/*.rsc admin@$CHR_IP:/
sleep 2

echo "Running setup script..."
sshpass -p $TEMP_PASS ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null admin@$CHR_IP "/system/script/add name=\"setup\" source=[/file get [/file find where name=\"setup.rsc\"] contents];/system/script/run [find name=\"setup\"];/system/script/remove [find name=\"setup\"]"
sleep 5


ARP-PROXY za Internet
NAT
NO VPN 
NO IPSEC
Location variable