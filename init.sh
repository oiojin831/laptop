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

sudo su - oiojin831 <<'EOF'
# set ssh
echo "in oiojin831"
cd ~
mkdir .ssh
chmod 700 .ssh
touch .ssh/authorized_keys
chmod 600 .ssh/authorized_keys
PUBLIC_KEY="ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDdod/sf8GyY980SGyvRrzcKVfLSyDcM8bpheuJCa28Xps7WU+FKnxkRXCknC2CPiZnXhJpwbwVG+SHh+VABzYZVAmmkW/FzJUMzdagEEtkXTdpsQBPKfmNf8+kFNDxKSac5FPHz/hInzB4/3avsZviy3tRvk86npF9huvvj31mUk6G2GRk2+bjO0MGCY2RImpmQeTZvE7r81EwoA8EXu66HlWCAmNyFpFwNCzKiLuH6X16m00O96knRXWRmKEo8iTue5hoBNdg01xReiQ2crvobayTFyeiOQcj1nlIDMpRlnw/0SzzZumFu5tSW2VWDQ/zdNEhM9RDVZ5eSLPmLCx9 ipad-blink"
PUBLIC_KEY2="ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCve6vpUfZVgk2UPWKNXYPQ+8Z3Qx5veYziUmbYY223npb5yk04dIqMMUeMQTg51o9DZEy1Jbrklugeyc0R82pwt9u/NuNsFJJuuVFaBrHNSFhZp3wqT0pjobnCFTfBzn66EEnFd2pRiFOuOTAK6LQw5Fmxpms     hrvnUpNOzmlgw81HLSHaBOmXvlksQdII/b7lApovVSH5CIhdAZU6xbB73YsJK+iRIj65feCqdoq2YmAADjPaZj68vU5PsqU0HTkHb4chtzWN8AQKTNMkhltkzqo7FvhxcX1uzmKi3ibRvdHZfjl1jEmQpxNVexSYQoq5WZtddKfm23OpVF+neebXoVLt460FV8Q     Nw5gvwTzNxpYs5xMvmhCT45HsTADbproyRSdkSGzlJ9QdRmRxbnU5bXkmu89LzbfUdSeayaqstsk2jRbyjQoNQ3olUrO1mHzjuDOY8KUVZrzqJhbkmZsU4NckWk3lRzlplfnTlaD47saXf/xW87bAlnUXfP634KzDsNyEz0uTL3c6w+9MRb5NkwTRcvYKMyW5TB     yJYpJVneMVvHKKjGYzZYeOwS+gLxSVE4t3c5uHf29nynIMugK7ah+q7S18S7LsOcijyaOsKY4zCkLw58MVpqESMOBuhwt99GOYh72LJaUr+Sj/YVZjr83refPmXPsEbMhTKUlnGKw== withsellit.com-macbook"
echo $PUBLIC_KEY | cat >> .ssh/authorized_keys
echo $PUBLIC_KEY2 | cat >> .ssh/authorized_keys

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
