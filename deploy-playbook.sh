#!/usr/bin/env bash
########################## REQUIREMENTS
sudo apt-get update
sudo apt-get install software-properties-common
sudo apt-add-repository ppa:ansible/ansible
sudo apt-get -y install ansible
########################## VARIBLES

PLAYBOOK_FILE="deploy.yml"
INVENTORY_FILE="hosts.vagrant"
EXTRA_ARGS="--list-tasks --list-hosts"

SOURCE_DIR=$(pwd)
DESTINATION_DIR="/vagrant"
LOGFILE=$SOURCE_DIR/update.log


########################## CODE

echo "Starting log" > $LOGFILE

# echo -n "Adding key... " >> $LOGFILE
# cd ~/.ssh
# cat id_rsa.pub >> authorized_keys
# SORTIDA=$?
# echo OK >> $LOGFILE

echo "Updating... " >> $LOGFILE
cd $DESTINATION_DIR
ansible-playbook provisioning/$PLAYBOOK_FILE -i $INVENTORY_FILE >> $LOGFILE
SORTIDA=$?
echo OK >> $LOGFILE

if [ "$SORTIDA" -eq 0 ];
then
    echo "deploy succeed"
else
    echo "deploy failed!"
fi

echo "Ending log" >> $LOGFILE

exit $SORTIDA