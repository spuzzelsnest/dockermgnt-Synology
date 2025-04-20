# dockermgnt-ARM32v5
As I was thinkering with some old hardware (Check Point L-50 Firewall) running openWRT, I created this branch with support for ARM32v6. This adds Portainer, the unifi-Controller.

## Pre-Check
Check ifyou current shell is bash. By default openWRT uses /bin/ash
```
echo $SHELL

```
If the current shell is not /bin/bash, make sure it is installed.
```
opkg install bash

```
To change is, change it in the /etc/passwd file
```
vi /etc/passwd

```
Reboot the device after this, and run the same check again to see if the shell has changed to /bin/bash.

## Prerequisits
In order to have the docker network running, macvlan is needed. This gives you the option to host containers on your local subnet. However the network interface where the network will be hosted on needs to be set to promiscuous mode.

```
opkg insetall docker-compose dockerd macvlan

```
## How It works
- git clone the repository
```
git clone --branch arm32v6 https://github.com/spuzzelsnest/dockermgnt-Synology.git mgnt/

```
- Change the directory and copy the .env-example to .env
```
cd mgnt && cp .env-example .env

```
- Edit the .env file to your likes

### Network
If you prefer to have the network created through the docker-compose file, you can uncomment that config.
If a docker network is created externally. This is done so with the following syntacs:

```
docker network create -d macvlan --subnet 192.168.1.0/24 --gateway 192.168.1.1 -o parent=eth0 --aux-address="host:192.168.1.XX" mainLan

```

### Run the script
Copy and make necessary changes to the .env file
```
cp .env-example .env

```

Run docker-compose
```
docker-compose up -d

```

### Troubleshooting
Running portainer will allow you to read container log files more easily.
