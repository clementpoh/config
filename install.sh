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
echo -e "\n Updating local repositories. \n"
git update

# Install fonts.
# echo -e "\n Installing fonts locally. \n"
# fonts/powerline-fonts/install.sh

if [ ! -d "$HOME/.config" ]; then
    echo "Symlinking config folder"
    ln -s "$DIR" "$HOME/.config"
fi

# Vim setup
if [ ! -d "vim/autoload/plug.vim" ]; then
    echo "Installing Plug"
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    ln -s "$DIR/vim" "$HOME/.vim"
fi

# Link all the rc files.
echo -e "\n Linking run command files. \n"
for i in $( ls *rc ); do
    if [ ! -f "$HOME/.$i" ]; then
        echo "Symlinking $HOME/.$i to $RDIR/$i"
        ln -s "$DIR/$i" "$HOME/.$i"
    else
        echo "$HOME/.$i already exists."
    fi
done

# Link the non rc config files.
for i in bash_profile gitconfig pystartup gdbinit; do
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
