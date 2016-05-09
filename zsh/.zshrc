if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi


if [ -d ${ZDOTDIR:-$HOME}/.zsh_global ]; then
  source ${ZDOTDIR:-$HOME}/.zsh_global/*
fi

if [ -d ${ZDOTDIR:-$HOME}/.zshrc.local ]; then
  source ${ZDOTDIR:-$HOME}/.zshrc.local
fi

