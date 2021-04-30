#!/bin/bash

#setup git
git config --global user.name "Adam Kuziemski"
git config --global user.email "kuziemski.a@gmail.com"

#install fira code
pacman -S ttf-fira-code

#install yay
pacman -S --needed git base-devel
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

#install rust and the tools
pacman -S rust
rustup component add rustfmt
rustup component add clippy
rustup component add rls

#setup docker
pacman -S docker
systemctl start docker
systemctl enable docker
docker pull postgres

#change max user watches so chokidar doesn't die
echo fs.inotify.max_user_watches=524288 | tee /etc/sysctl.d/50_max_user_watches.conf && sysctl --system

#copy settings over
cp ./.bashrc ~
cp ./.vimrc ~
cp ./kglobalshortcutsrc ~/.config/kglobalshortcutsrc
cp ./khotkeysrc ~/.config/khotkeysrc
cp ./kwinrc ~/.config/kwinrc
cp ./kwinrulesrc ~/.config/kwinrulesrc
cp ./kscreenlockerrc ~/.config/kscreenlockerrc
