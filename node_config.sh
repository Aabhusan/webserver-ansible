#!/bin/sh
user=aabhusan

mkdir /home/$user/Desktop/node_app

cd /home/$user/Desktop/node_app
curl -sL https://deb.nodesource.com/setup_8.x -o nodesource_setup.sh

bash nodesource_setup.sh
apt install nodejs -y

apt install build-essential

cp hello.js /home/$user/Desktop/node_app

# install pm2

sudo npm install pm2@latest -g
pm2 start hello.js
pm2 startup systemd
sudo env PATH=$PATH:/usr/bin /usr/lib/node_modules/pm2/bin/pm2 startup systemd -u $user --hp /home/$user
pm2 save
sudo systemctl start pm2-$user





