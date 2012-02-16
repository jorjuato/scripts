#|/bin/sh

if  [ -f /tmp/bifi_ip ]; then
	OLD_IP=$(cat /tmp/bifi_ip)
else
	OLD_IP="EMPTY"
fi

NEW_IP=$(host bifi.homelinux.com| awk '{print $4}')

#if [ OLD_IP = NEW_IP ]; then
if [ 'arch'=='x86_64' ]; then
#<	exit 0
	echo "hola"
else
	echo "adios"
#	sed '/.*$OLD_IP.*/d' /var/lib/denyhosts/allowed-hosts 
#	echo $NEW_IP >> /var/lib/denyhosts/allowed-hosts
#	echo $NEW_IP > /tmp/bifi_ip
fi
