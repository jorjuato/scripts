#!/bin/bash
# 
# Debian JBox:
# first boot script
#

#Get the default username
USER=$(grep /etc/passwd -e 1000 | awk '{split($0,a,":"); print a[1]}')

#Add it to sudo group
adduser $USER sudo

#Allow default user to poweroff et all the machine
echo "$USER all = NOPASSWD: /sbin/halt, /sbin/reboot, /usr/sbin/pm-suspend, /usr/sbin/pm-hibernate, /usr/sbin/service" > /etc/sudoers.d/default

#Modify nodm configuration to boot as default user
echo "NODM_USER=$USER" >> /etc/default/nodm

#Modify interfaces conf to adapt network-manager specialties
cat > /etc/network/interfaces << EOF
# This file describes the network interfaces available on your system
# and how to activate them. For more information, see interfaces(5).

# The loopback network interface
auto lo
iface lo inet loopback
EOF

#Choose the appropiate fbxkb, too ugly but...
if [ 'arch'=='x86_64' ];
then
    mv /usr/local/bin/fbxkb_amd64 /usr/local/bin/fbxkb
else
    mv /usr/local/bin/fbxkb_i386 /usr/local/bin/fbxkb
fi

#Restart services 
service network-manager stop
service nodm stop
service network-manager start
service nodm start

#Now, clean yourself!! 
cat > /etc/rc.local <<EOF
#!/bin/sh -e
#
# rc.local
#
# This script is executed at the end of each multiuser runlevel.
# Make sure that the script will "exit 0" on success or any other
# value on error.
#
# In order to enable or disable this script just change the execution
# bits.
#
# By default this script does nothing.

exit 0

EOF

exit 0
