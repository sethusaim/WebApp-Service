#!bin/bash

sudo apt update

sudo apt-get update

sudo apt install python3-pip -y

git init 

git remote remove origin

git remote add origin https://github.com/sethusaim/WebApp-Service.git

git fetch origin

git checkout origin/main -- application

cd application

pip3 install -r requirements.txt

sudo mv flask /usr/bin

cd /home/ubuntu

sudo apt-get install nginx -y

pip3 install gunicorn

sudo apt-get install -y apache2-utils

sudo htpasswd -c /etc/nginx/.htpasswd USERNAME

cd /etc/nginx/sites-enabled

sudo nano flaskapp

server {
    listen 8080;
    server_name YOUR_IP_OR_DOMAIN;
    auth_basic “Administrator-Area”;
    auth_basic_user_file /etc/nginx/.htpasswd; 

    location / {
        proxy_pass http://localhost:8000;
        include /etc/nginx/proxy_params;
        proxy_redirect off;
    }
}

sudo service nginx restart

cd /home/ubuntu/

cd  /etc/systemd/system

sudo nano app.service

[Unit]
Description=Application Service
After=network.target

[Service]
User=ubuntu
Group=www-data
WorkingDirectory=/home/ubuntu/application
Restart=on-failure
RestartSec=30

ExecStart=/usr/bin/gunicorn3 --workers 3 --bind unix:flaskapp.sock -m 007 app:app

[Install]
WantedBy=multi-user.target

sudo systemctl daemon-reload

sudo systemctl enable app

sudo systemctl start app

cd /home/ubuntu/application

cd /etc/nginx/sites-enabled/

sudo nano app

server {
    listen 8080;
    server_name YOUR_IP_OR_DOMAIN;
    auth_basic “Administrator-Area”;
    auth_basic_user_file /etc/nginx/.htpasswd; 

    location / {
        proxy_pass http://unix:/home/ubuntu/application/flaskapp.sock;
        include /etc/nginx/proxy_params;
        proxy_redirect off;
    }
}

cd /home/ubuntu

sudo service nginx restart

sudo service app restart