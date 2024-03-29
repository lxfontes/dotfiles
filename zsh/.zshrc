if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

export PATH=$HOME/bin:/usr/local/bin:/usr/local/sbin:$PATH
# homebrew paths
export PATH=/opt/homebrew/sbin:/opt/homebrew/bin:/opt/homebrew/opt/gnu-getopt/bin:$PATH

## direnv.net
eval "$(direnv hook zsh)"

## jump
eval "$(zoxide init --cmd j zsh)"

## rubby
eval "$(rbenv init - --no-rehash)"

source "/opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc"
source "/opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc"
source <(kubectl completion zsh)

iterm_badge() {
 printf "\e]1337;SetBadgeFormat=%s\a" \
  $(echo -n "$@" | base64)
}

tmux_set_title() {
  printf '\033]2;%s\033\\' "$1"
}

function kgetall {
  for i in $(kubectl api-resources --verbs=list --namespaced -o name | grep -v "events.events.k8s.io" | grep -v "events" | sort | uniq); do
    echo "Resource:" $i
    kubectl -n ${1} get --ignore-not-found ${i}
  done
}

# Homebrew will not send analytics
export HOMEBREW_NO_ANALYTICS=1
# Homebrew will not auto-update before running `brew install`, `brew upgrade` or `brew tap`.
export HOMEBREW_NO_AUTO_UPDATE=1
alias flushdns="sudo dscacheutil -flushcache;sudo killall -HUP mDNSResponder;say cache flushed"


alias bi='bundle install'
alias be='bundle exec'

export GOPATH=$HOME/code
export PATH=$PATH:$GOPATH/bin

alias vi=nvim
alias vim=nvim
export EDITOR=nvim
export VISUAL=nvim

alias k=kubectl

alias g=git

alias h=heroku

alias tf=terraform

alias z=j

alias hazip="dig +short myip.opendns.com @resolver1.opendns.com"
alias urlencode='python -c "import sys, urllib as ul; print ul.quote_plus(sys.argv[1]);"'
alias dev_layout='tmux split-window -h -p 40 && tmux split-window -v'

alias gg='cd "$(git rev-parse --show-toplevel)"'

alias kall='kubectl get $(kubectl api-resources --namespaced=true --no-headers -o name | egrep -v "events|nodes" | paste -s -d, - ) --no-headers'

bindkey "^r" history-incremental-search-backward
export KEYTIMEOUT=1

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH="$(yarn global bin):$PATH"

export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# always last
if [ -f ${ZDOTDIR:-$HOME}/.zshrc.local ]; then
  source ${ZDOTDIR:-$HOME}/.zshrc.local
fi
tmux_set_title base
