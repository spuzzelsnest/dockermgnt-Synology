# dockermgnt
A stack I use on my Synology NAS, running piHole, unifi-Controller, Portainer, LibreNMS

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


### Troubleshooting

Running portainer will allow you to read container log files more easily.

check that the connection between unifi and the mongo container is working fine.
