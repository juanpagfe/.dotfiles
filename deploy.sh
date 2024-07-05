#!/bin/zsh

#Configure
unameOut="$(uname -s)"
case "${unameOut}" in
    Linux*)     machine=Linux;;
    Darwin*)    machine=Mac;;
    CYGWIN*)    machine=Cygwin;;
    MINGW*)     machine=MinGw;;
    MSYS_NT*)   machine=Git;;
    *)          machine="UNKNOWN:${unameOut}"
esac

if [ ! -d ~/.config ]; then
    mkdir ~/.config
fi
if [ "$machine" = "Mac" ]; then
    echo "Installing for Mac..."
    cp -rf mac/.config/* ~/.config
fi
if [ "$machine" = "Linux" ]; then
    echo "Installing for Linux..."
    cp -rf linux/.config/* ~/.config
fi
echo "Installing common..."
cp -rf common/.config/* ~/.config


#Copy bin
if [ ! -d ~/.local ]; then
    mkdir ~/.local
fi
cp -r common/.local/bin/* ~/.local/bin

#Merge environment files
if [ ! -f envrc ]; then
    echo "Generating envrc file"
    if [ -f /tmp/envrc ]; then
        sudo rm /tmp/envrc
    fi
    touch /tmp/envrc
    cat env/*.sh > /tmp/envrc
fi

#Install environment files
if [ -f envrc ]; then
    sudo mv envrc /etc/envrc
else
    sudo mv /tmp/envrc /etc/envrc
fi
echo "Installation completed"
