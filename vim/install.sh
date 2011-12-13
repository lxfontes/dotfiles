#!/bin/sh
D=`dirname $0`

if [ -f $HOME/.vim/vimrc ]; then
  cp $HOME/.vim/vimrc $HOME/.vim/vimrc.zzbk
fi
cp $D/vimrc $HOME/.vim/vimrc
cp $D/update_bundles $HOME/.vim/update_bundles

mkdir -p $HOME/.vim/autoload $HOME/.vim/bundle; \
	curl -so $HOME/.vim/autoload/pathogen.vim \
	    https://raw.github.com/tpope/vim-pathogen/HEAD/autoload/pathogen.vim

cp -r $D/sandvine $HOME/.vim/bundle/
