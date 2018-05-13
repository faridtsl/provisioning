#!/usr/bin/env bash

# Updating
apt update

# Setting up powerline
apt install fonts-powerline
git clone https://github.com/powerline/powerline /opt/powerline
pip install --user --editable=/opt/powerline
ln -s /opt/powerline/scripts/powerline ~/.local/bin

# Setting up vim
## .vim directory
mkdir ~/.vim
mkdir ~/.config

## Pathogen
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

## Plugins
git clone https://github.com/scrooloose/nerdtree ~/.vim/bundle/nerdtree
git clone https://github.com/ervandew/supertab ~/.vim/bundle/supertab
git clone https://github.com/easymotion/vim-easymotion ~/.vim/bundle/vim-easymotion

# Setting up fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

# Setting up oh-my-zsh
apt install zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Setting up i3
apt install i3 i3-wm i3lock i3status i3bar

## i3-gaps

cd /opt
### clone the repository
apt install libxcb-keysyms1-dev libpango1.0-dev libxcb-util0-dev xcb libxcb1-dev libxcb-icccm4-dev libyajl-dev libev-dev libxcb-xkb-dev libxcb-cursor-dev libxkbcommon-dev libxcb-xinerama0-dev libxkbcommon-x11-dev libstartup-notification0-dev libxcb-randr0-dev libxcb-xrm0 libxcb-xrm-dev
git clone https://www.github.com/Airblader/i3 i3-gaps
cd i3-gaps

### compile & install
autoreconf --force --install
rm -rf build/
mkdir -p build && cd build/

### Disabling sanitizers is important for release versions!
### The prefix and sysconfdir are, obviously, dependent on the distribution.
../configure --prefix=/usr --sysconfdir=/etc --disable-sanitizers
make
make install
cd ../..

## bumblebee status
git clone git://github.com/tobi-wan-kenobi/bumblebee-status ~/.config/i3/bumblebee-status
pip install netifaces

## rofi
git clone https://github.com/DaveDavenport/rofi
cd rofi/
git submodule update --init
autoreconf -i
mkdir build
cd build
../configure
make
make install
cd ../..

## ranger
git clone https://github.com/ranger/ranger
cd ranger
sudo make install
sudo python setup.py install --optimize=1 --record=install_log.txt
cd ..

## Dotfiles
git clone https://github.com/faridtsl/dotfiles
cd dotfiles
cp -r i3/ ~/.config
cp vim/.vimrc ~/.vimrc
cp zsh/.zshrc ~/.zshrc

## Nerdfonts
git clone https://github.com/ryanoasis/nerd-fonts
cd nerd-fonts
./install.sh
cd ..


## Virtualenvwrapper

pip install virtualenv
mkdir ~/.virtualenvs
pip install virtualenvwrapper

