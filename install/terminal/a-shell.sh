#!/bin/bash
# TODO now take a look at defaults in configs/.bashrc and add them to your .bashrc
# Configure the bash shell using Omakub defaults
[ -f ~/.bashrc ] && mv ~/.bashrc ~/.bashrc.bak
cp ~/.local/share/cirilck-kub/configs/bashrc ~/.bashrc

# Load the PATH for use later in the installers
source ~/.local/share/cirilck-kub/defaults/bash/shell

[ -f ~/.inputrc ] && mv ~/.inputrc ~/.inputrc.bak
# Configure the inputrc using Omakub defaults
cp ~/.local/share/cirilck-kub/configs/inputrc ~/.inputrc
