#!/bin/bash

# Cheking dependencies
echo "Cheking dependencies..."
sleep 3
hxselect="`which hxselect`"
wget="`which wget`"
lynx="`which lynx`"

# Cheking if hxselect from html-xml-utils is present
echo "Searching for hxselect from html-xml-utils"
sleep 3
if [ -n "$hxselect" ]
  then
    echo "hxselect found"
    echo "hxselect: $hxselect"
  else
    echo "hxselect not found"
    echo "please install html-xml-utils package first..."
    exit
fi
sleep 5

#Cheking if wget is present
echo "Searching for wget"
sleep 3
if [ -n "$wget" ]
  then
    echo "wget found"
    echo "wget: $wget"
  else
    echo "wget not found"
    echo "Please install wget first..."
    exit
fi
sleep 5

# Cheking if lynx web browser is present
echo "Searching for lynx web browser"
sleep 3
if [ -n "$lynx" ]
  then
    echo "lynx found"
    echo "lynx: $lynx"
  else
    echo "lynx not found"
    echo "please install lynx first..."
    exit
fi
sleep 5

# Checking if directory is present
echo "Cheking working diretory"
sleep 3
homebin=`ls $HOME | grep -o bin`
pathbin=`echo $PATH | grep -o "$HOME/bin" | uniq`
if [ -n "$homebin" ]
  then
    echo "Folder $HOME/bin is found"
    echo "no need to create it"
  else
    echo "Folder $HOME/bin is not found"
    echo "will be creted later"
fi
if [ -n "$pathbin" ]
  then
    echo "and included in PATH environment"
    echo "no need setting it."
  else
    echo "and not included in PATH environment"
    echo "will be set up later."
fi
sleep 5

# Installing
echo "All needed dependecies is completed."
read -rsp $'Install? <y/N>\n' -n1 key
if [[ $key =~ ^[Yy]$ ]]
  then
    echo "Create and setup diretory..."
    sleep 5
    mkdir -p $HOME/.xhdownloader
    if [ -n "$homebin" ]
      then
        echo "Folder $HOME/bin exists"
        echo "skipping"
      else
        mkdir -p $HOME/bin
    fi
    cp -R src/exh-downloader $HOME/bin/exh-downloader
    chmod +x $HOME/bin/exh-downloader
    cp -R src/exhentai.cookie $HOME/.xhdownloader
    if [ -z "$pathbin" ]
      then
        cp -R $HOME/.bashrc $HOME/.bashrc.bak
        echo "export PATH=$HOME/bin:$PATH" >> $HOME/.bashrc
    fi    
  else
    echo "Installation aborted"
    exit
fi
source $HOME/.bashrc
echo "Installation completed!"
echo "Now you can use exhentai downloader with command:"
echo "exh-downloader gallery-link"
