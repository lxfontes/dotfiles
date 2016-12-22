if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

if [ -d ${ZDOTDIR:-$HOME}/.zsh_global ]; then
  for file in ${ZDOTDIR:-$HOME}/.zsh_global/*; do
    source ${file}
  done
fi

if [ -f ${ZDOTDIR:-$HOME}/.zshrc.local ]; then
  source ${ZDOTDIR:-$HOME}/.zshrc.local
fi

