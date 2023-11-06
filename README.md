# dockermgnt
A stack I use on my Synology NAS, running piHole, unifi-Controller, Portainer.

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


### Run the script

```
docker-compose up -d

```

Copy the and adapt the .env file

```
cp .env-example .env

```


Copy the init.
