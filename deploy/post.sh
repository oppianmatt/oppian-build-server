#!/bin/bash

# This is called post download and used to setup the environment for the first time.

# argument will be deploy dir
DEPLOY_DIR=$1

# kill off any other buildbots
pkill -9 -f buildbot

# create the virtual env
python boot.py build-env

# activate it
source build-env/bin/activate

# install requirements
pip install -r requirements.txt

# copy ssh key and set mode
cp deploy/id_rsa ~/.ssh/id_rsa
chmod 600 ~/.ssh/id_rsa

# start the daemons
for botdir in master-oserver slave-localhost ; do
  buildbot start $botdir
done