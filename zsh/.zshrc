if [ -d ${ZDOTDIR:-$HOME}/.zsh_global ]; then
  source ${ZDOTDIR:-$HOME}/.zsh_global/*
fi

if [ -f ${ZDOTDIR:-$HOME}/.zshrc.local ]; then
  source ${ZDOTDIR:-$HOME}/.zshrc.local
fi
