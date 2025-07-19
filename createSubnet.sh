#!/bin/bash

ip link add lnk01 link eth1 type macvlan mode bridge
ip addr add 10.72.72.6/32 dev lnk01
ip link set lnk01 up
ip route add 10.72.72.0/29 dev lnk01
	
	
#ip link set eth1 promisc on
	
ifconfig eth1
ifconfig lnk01
