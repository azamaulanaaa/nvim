#!/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

sudo add-apt-repository -y ppa:aslatter/ppa
sudo apt install -y alacritty

ln -s $SCRIPT_DIR/config ~/.config/alacritty
