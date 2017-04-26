#!/bin/bash

#Stop salt
service salt-minion stop
service salt-master stop

#Create directories, files and configurations
mkdir -p /srv/{salt,pillar}
mv /tmp/users.sls /srv/salt/users.sls
mv /tmp/cron.sls /srv/salt/cron.sls
echo "master: 127.0.0.1" >>/etc/salt/minion

#Start salt service, add some time for t2.micro
service salt-minion start
service salt-master start
sleep 30

#Sign key
salt-key -a '*' -y

#Restart salt service
service salt-minion restart
service salt-master restart
sleep 30

#Apply salt states
salt '*' state.apply users
salt '*' state.apply cron
