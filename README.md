# dockermgnt-Synology
A stack I use on my Synology NAS, running Portainer, Heimdall and watchtower.

### How It works

- git clone the repository 

- Copy the .env-example to .env

- Edit the .env file to your likes

```

# EXAMPLE ENV

# > id
PUID=10XX
PGID=10X

# > curl https://ipapi.co/timezone
# https://en.wikipedia.org/wiki/List_of_tz_database_time_zones
TZ=Europe/Brussels

# The configuration for all containers
CONFIG_PATH=/[PATH-TO-CONFIG]/config

# no | on-failure | always | unless-stopped
# https://docs.docker.com/config/containers/start-containers-automatically/
RESTART_POLICY=unless-stopped

ESTART_POLICY=unless-stopped
DOCKER_SOCKET=/var/run/docker.sock:

############
# HEIMDALL #
############
# Dashboard for all other containers
# https://github.com/linuxserver/Heimdall
# If you're going to remember one port, make sure it's this one:
HEIMDALL_PORT=9000
HEIMDALL_PORT_SSL=9001

#############
# PORTAINER #
#############
# Easy Docker container management
# https://github.com/portainer/portainer
PORTAINER_DATA=/[PATH-TO-DATA]/data
PORTAINER_PORT_UI=9100
PORTAINER_PORT_SSL=9101

##############
# WATCHTOWER #
##############
# Automated Docker container updates
# https://github.com/containrrr/watchtower

# True: Only update with label 'com.centurylinklabs.watchtower.enable=true'
# False: Update all containers
WATCHTOWER_LABEL_UPDATE=true

# When to run, examples:
# "0 0 5 9 1 *" -> Every 9th January at 05:00
# "0 0 5 4 * *" -> Every 4th of the month at 05:00
# "0 0 5 * * *" -> Every day at 05:00
WATCHTOWER_SCHEDULE=0 0 5 4 * *

# Notification method: slack or email
WATCHTOWER_NOTIFICATION=slack
# Slack channel, format: https://hooks.slack.com/services/xxx/yyy/zzz
WATCHTOWER_SLACK=

WATCHTOWER_EMAIL=
SMTP_FROM=
SMTP_SERVER=
SMTP_PORT=
SMTP_USER=
SMTP_PASS=

```


- Run the script

```

docker-compose up -d

```
