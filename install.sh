#!/bin/sh

# Establish what directory the script is in.
SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
  TARGET="$(readlink "$SOURCE")"
  if [[ $SOURCE == /* ]]; then
    # echo "SOURCE '$SOURCE' is an absolute symlink to '$TARGET'"
    SOURCE="$TARGET"
  else
    DIR="$( dirname "$SOURCE" )"
    # echo "SOURCE '$SOURCE' is a relative symlink to '$TARGET' (relative to '$DIR')"
    # if $SOURCE is a relative symlink, we need to resolve it relative to the
    # path where the symlink file was located
    SOURCE="$DIR/$TARGET"
  fi
done

RDIR="$( dirname "$SOURCE" )"
DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"

# Bash setup
if [ ! -f "~/.bashrc" ]; then
    echo "Symlinking bashrc"
    ln -s $DIR/bashrc ~/.bashrc
    ln -s $DIR/bash_profile ~/.bash_profile
fi

# Vim setup
if [ ! -d "vim/bundle" ]; then
    echo "Installing neobundle"
    mkdir -p vim/bundle
    git clone https://github.com/shougo/neobundle.vim vim/bundle/neobundle.vim
    ln -s $DIR/vim ~/.vim
fi

if [ ! -f "~/.vimrc" ]; then
    echo "Symlinking the vimrc"
    ln -s $DIR/vimrc ~/.vimrc
fi
