#!/bin/sh
D=`dirname $0`
mkdir -p $HOME/.vim/bundle

if [ -f $HOME/.vim/vimrc ]; then
  cp $HOME/.vim/vimrc $HOME/.vim/vimrc.zzbk
fi
cp $D/vimrc $HOME/.vim/vimrc
if [ -d $HOME/.vim/vundle.git ]; then
(cd $HOME/.vim/vundle.git && git pull)
else
git clone http://github.com/gmarik/vundle.git $HOME/.vim/vundle.git
fi

cp -r $D/sandvine $HOME/.vim/bundle/
