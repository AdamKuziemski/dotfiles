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
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
rustup component add rustfmt
rustup component add clippy
rustup component add rls rust-analysis rust-src

#install visual studio code and extensions
yay visual studio code
code --install-extension angular.ng-template
code --install-extension infinity1207.angular2-switcher
code --install-extension dbaeumer.vscode-eslint
code --install-extension mrmlnc.vscode-scss
code --install-extension maxvanderschee.web-accessibility
code --install-extension rust-lang.rust
code --install-extension shd101wyy.markdown-preview-enhanced

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
