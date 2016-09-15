#!/usr/bin/env bash

set -e

sudo apt-get update -yqq
sudo apt-get -y upgrade

# essential
sudo apt-get -y install build-essential libssl-dev

# git
sudo apt-get -y install git

# Vim
sudo apt-get -y install vim

# zsh
sudo apt-get -y install zsh

# Tmux
sudo apt-get install -yqq python-software-properties software-properties-common
sudo add-apt-repository -y ppa:pi-rho/dev
sudo apt-get update -yqq
sudo apt-get install -yqq tmux

# Dcoker
# https://github.com/docker/docker/blob/master/hack/install.sh
wget -qO- https://get.docker.com/ | sh

# add user
sudo adduser --gecos "Eung Jin Lee" oiojin831 --disabled-password

# give root previlage
sudo echo "oiojin831 ALL=(ALL) NOPASSWD:ALL" | sudo tee -a /etc/sudoers

# initail env is in ubuntu user so we do this there
sudo mkdir /home/oiojin831/.ssh
sudo chmod 700 /home/oiojin831/.ssh
sudo touch /home/oiojin831/.ssh/authorized_keys
sudo chmod 600 /home/oiojin831/.ssh/authorized_keys
sudo echo $PUBLIC_KEY | sudo cat >> /home/oiojin831/.ssh/authorized_keys
sudo echo $PUBLIC_KEY2 | sudo cat >> /home/oiojin831/.ssh/authorized_keys

sudo su - oiojin831 <<'EOF'
# set ssh
echo "in oiojin831"
cd ~

# Install vim plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Dotfiles
wget -O ~/.tmux.conf https://raw.githubusercontent.com/christoomey/dotfiles/master/tmux/tmux.conf
wget -O ~/.vimrc https://raw.githubusercontent.com/oiojin831/dotfiles/master/vimrc
wget -O ~/.vimrc.bundles https://raw.githubusercontent.com/oiojin831/dotfiles/master/vimrc.bundles

# oh-my-zsh
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
# theme
wget -O ~/.oh-my-zsh/themes/xxf.zsh-theme https://gist.githubusercontent.com/oiojin831/646c517ffea9d4c67e1ed2619b99da0d/raw/2b5231ff4722382a98286c127b8fa0dee1c47aa6/xxf.zsh-theme
# change theme
sed -i "s/robbyrussell/xxf/" .zshrc

sudo chsh -s $(which zsh) oiojin831
EOF
