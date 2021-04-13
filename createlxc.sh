#!/bin/bash
if [ $1 ]; then
	echo "The container will be named $1"
	DIR=/var/lib/lxc/$1/rootfs/usr/sbin/startup
	sudo lxc-create -t download -n $1 -- -d debian -r stretch -a amd64
	cat <<- EOF >$DIR
	useradd --create-home -s /bin/bash user
	echo 'user:user' | chpasswd
	sed -i -e 's/# en_US.UTF-8 UTF-8/fr_FR.UTF-8 UTF-8/' /etc/locale.gen && locale-gen fr_FR.UTF-8 > /dev/null && echo 'LANG="fr_FR.UTF-8"' > /etc/default/locale > /dev/null
	apt-get update
	apt-get install sudo python ssh -y
	adduser user sudo
	echo "\n\n"
	hostname -I
	echo "SSH and python are enabled | user: user pwd: user"
	EOF
	chmod +x $DIR
	sudo lxc-start -n $1 && sleep 15
	sudo lxc-attach -n $1 -- chmod +x /usr/sbin/startup
	sudo lxc-attach -n $1 -- startup
	exit 0
else
	echo "Please enter the new lxc container name"
	exit 1
fi
