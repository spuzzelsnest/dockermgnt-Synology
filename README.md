# dockermgnt
A stack I use on my Synology NAS, running piHole, unifi-Controller, Portainer, LibreNMS. I have created different branches for different hardware. If you are not sure if this would run on your hardware, you can check the next section, which branch can be used in your case.

## Pre-checks
### CPU-info
If you are running this on different hardware, you can check your hardware like so:

```
uname -a

```
or 
```
cat /proc/cpuinfo | grep -e 'model'

```

## How It works

- git clone the repository 
- Copy the .env-example to .env
- Edit the .env file to your likes
- Configure Network


### Configure Network

Running macvlan gives you the option to host containers on your local subnet. However the network interface where the network will be hosted on needs to be set to promiscuous mode.

```
sudo ip link set eth0 promisc on 

```

If you prefer to have the network created through the docker-compose file, you can uncomment that config.
If a docker network is created externally. This is done so:

```
docker network create -d macvlan --subnet 192.168.1.0/24 --gateway 192.168.1.1 -o parent=eth0 --aux-address="host:192.168.1.XX" mainLan

```

If you are running docker on the same interface as the gateway of your network, please look into the createSubnet.EXAMPLE
Changing the into to you liking, this creates a virtual interface to handle the traffic between pihole and the gateway.

### Run the script

Copy and make necessary changes to the .env file
```
cp .env-example .env

```

Copy and make necessary changes to the init-mongo-EXAMPLE.js 
```
cp init-mongo-EXAMPLE.js init-mongo.js

```

Run docker-compose
```
docker-compose up -d

```
### Setting up Pihole 

If there is an issue with the password of the pihole container you can run the following commands 


```
docker exec -it mgnt-pihole bash

pihole setpassword

```

### Troubleshooting

Running portainer will allow you to read container log files more easily.

check that the connection between unifi and the mongo container is working fine.


