#!/bin/sh

#Ensure basic apps are installed

# Install base apps pip and ansible
echo "==================================="
echo " Setting up Mac"
echo "==================================="

   sudo easy_install pip
  sudo pip install ansible --quiet

installdir="/tmp/macinstall-$RANDOM"
mkdir $installdir

git clone https://github.com/blcain/ansible-laptop-setup.git $installdir

if [ ! -d $installdir ]; then
   echo "Failed to clone ansible repo"
   exit 1
else
   cd $installdir
   ansible-playbook -i ./hosts mac-os.yml --verbose
fi        

echo "Removing tmp installation dir"
rm -Rfv /tmp/installdir

echo "Mac setup is complete"
exit 0