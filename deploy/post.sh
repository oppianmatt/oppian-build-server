#!/bin/bash

# This is called post download and used to setup the environment for the first time.

# create the virtual env
python boot.py build-env

# activate it
source build-env/bin/activate

# install requirements
pip install -r requirements.txt

# copy ssh key and set mode
cp deploy/id_rsa ~/.ssh/id_rsa
chmod 600 ~/.ssh/id_rsa
