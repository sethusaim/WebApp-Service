#!bin/bash

sudo apt update

sudo apt-get update

sudo apt install python3-pip

git init 

git remote remove origin

git remote add origin https://github.com/sethusaim/WebApp-Service.git

git fetch origin

git checkout origin/main

pip3 install -r requirements.txt

