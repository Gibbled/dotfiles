#!/bin/bash
# This is to install packer and tpm to make all the things work
#

main(){
packer
tpm
}

packer(){
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
}

tpm(){
git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm
}
