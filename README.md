# dockermgnt
A stack I use on my Synology NAS, running piHole, unifi-Controller, Portainer.

## How It works

- git clone the repository 
- Copy the .env-example to .env
- Edit the .env file to your likes
- Create Docker Network

### Create Network

Docker "mainLan" network creation with macvlan.

```
docker network create --driver macvlan --subnet [IPADDRESS]/[CIDR} --gateway [IPADDRESS] --opt parent=eth0 mainLan

```




### Run the script

```
docker-compose up -d

```
