# CreateLXC - Bash script
A quick and easy way to create an lxc container for test environments 


## LXC Installation guide

Install LXC :

```
sudo apt install lxc
sudo apt install libvirt-clients iptables ebtables dnsmasq-base bridge-utils
sudo apt install --no-install-recommends libvirt-daemon-system
```
## Script installation

```
sudo mv createlxc.sh /usr/sbin/createlxc
```

You need to ru the script with sudo !
