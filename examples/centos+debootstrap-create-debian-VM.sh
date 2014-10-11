#!/bin/sh
set -x

IP_ADDR=10.20.0.230
NET_MASK=255.255.255.0
GATEWAY=10.20.0.1
HOSTNAME=debt1
DNS1=10.20.0.1

test -d /var/tmp/xen-create-image  || mkdir -p /var/tmp/xen-create-image

> /var/tmp/xen-create-image/networkcentos.tmpl
echo IP_ADDR= >>/var/tmp/xen-create-image/networkcentos.tmpl
echo NET_MASK=255.255.255.0 >>/var/tmp/xen-create-image/networkcentos.tmpl
echo GATE_WAY=10.20.0.1 >>/var/tmp/xen-create-image/networkcentos.tmpl
echo HOST_NAME=debt1 >>/var/tmp/xen-create-image/networkcentos.tmpl
echo NAME_SERVER1=10.20.0.1  >>/var/tmp/xen-create-image/networkcentos.tmpl
echo NAME_SERVER2=10.20.0.2  >>/var/tmp/xen-create-image/networkcentos.tmpl

# local hetzner debian mirror


test -f /etc/apt/sources.list && rm -f /etc/apt/sources.list ;wget -O /etc/apt/sources.list http://mirror.hetzner.de/debian/sources.list

xen-create-image --dir=/VM \
        --hostname=$HOSTNAME \
        --image=full \
        --size=4GB --fs=ext3 \
        --swap=1G \
        --disk_device=xvda \
        --role=editor \
        --roledir=/etc/xen-tools/role.d \
        --hooks=1 \
        --pygrub \
        --force \
        --vcpus=1 \
        --memory=512M \
        --bridge=br1 \
        --gateway=$GATEWAY \
        --ip=$IP_ADDR \
        --netmask=$NET_MASK \
        --install-method=debootstrap \
        --dist=wheezy \
        --mirror=http://ftp.de.debian.org/debian \
        --arch=amd64 \
        --kernel=/bootxen/vmlinuz-debian-wheezy-install \
        --initrd=/bootxen/initrd-debian-wheezy-install
 #
