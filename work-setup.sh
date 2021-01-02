#!/bin/bash

#setup git
git config --global user.name "Adam Kuziemski"
git config --global user.email "kuziemski.a@gmail.com"

#install fira code
pacman -S ttf-fira-code

#setup docker
systemctl start docker
systemctl enable docker

#change max user watches so chokidar doesn't die
echo fs.inotify.max_user_watches=524288 | tee /etc/sysctl.d/50_max_user_watches.conf && sysctl --system
