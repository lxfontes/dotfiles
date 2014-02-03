#!/bin/sh
D=`dirname $0`

if [ -f $HOME/.vim/vimrc ]; then
  cp $HOME/.vim/vimrc $HOME/.vim/vimrc.zzbk
fi
cp $D/vimrc $HOME/.vim/vimrc

mkdir -p $HOME/.vim/bundle;
if [ -d $HOME/.vim/bundle/vundle ]; then
#	(cd $HOME/.vim/bundle/vundle && git pull)
echo
else
	git clone http://github.com/gmarik/vundle.git $HOME/.vim/bundle/vundle
fi

go get -u github.com/jstemmer/gotags
go get -u github.com/nsf/gocode
