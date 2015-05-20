#!/bin/sh

# Establish what directory the script is in.
SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
  TARGET="$(readlink "$SOURCE")"
  if [[ $SOURCE == /* ]]; then
    # echo "SOURCE '$SOURCE' is an absolute link to '$TARGET'"
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

# Change the WD
cd $DIR

# Add $DIR to the path
export PATH="$PATH:$DIR/bin"

# Run the git update command to update the git repository and submodules.
echo -e "\nUpdating local repositories.\n"
git update

# Install fonts.
# echo -e "\nInstalling fonts locally.\n"
# fonts/powerline-fonts/install.sh

# Vim setup
if [ ! -d "vim/bundle" ]; then
    echo "Installing neobundle"
    mkdir -p vim/bundle
    git clone https://github.com/shougo/neobundle.vim vim/bundle/neobundle.vim
    ln -s "$DIR/vim" "$HOME/.vim"
fi

# Link all the rc files.
echo -e "\nLinking run command files.\n"
for i in $( ls *rc ); do
    if [ ! -f "$HOME/.$i" ]; then
        echo "Symlinking $HOME/.$i to $RDIR/$i"
        ln -s "$DIR/$i" "$HOME/.$i"
    else
        echo "$HOME/.$i already exists."
    fi
done

# Link the non rc config files.
for i in bash_profile gitconfig pystartup; do
    if [ ! -f "$HOME/.$i" ]; then
        echo "Symlinking $HOME/.$i to $RDIR/$i"
        ln -s "$DIR/$i" "$HOME/.$i"
    else
        echo "$HOME/.$i already exists."
    fi
done

# link the dircolors
file=dircolors
if [ ! -f "$HOME/.$file" ]; then
echo "Symlinking $HOME/.$file to $RDIR/dircolors/dircolors.ansi-universal"
    ln -s "$DIR/dircolors/dircolors.ansi-universal" "$HOME/.$file"
else
    echo "$HOME/.$file already exists."
fi
