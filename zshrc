ZSH=$HOME/.oh-my-zsh
ZSH_THEME="afowler"
CASE_SENSITIVE="true"
DISABLE_AUTO_UPDATE="true"

plugins=(git brew bundler encode64 extract gem github osx pip rails3 python)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=$HOME/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/X11/bin

export CLICOLOR=1
export LSCOLORS=Exfxcxdxbxegedabagacad

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

export GREP_OPTIONS="--color=auto"
export GREP_COLOR="4;33"

export PYTHONPATH=/usr/local/lib/python:.:$PYTHONPATH


# ALIASES

alias ls='ls -G'
alias rm='rm -vi'
alias cp='cp -vi'
alias mv='mv -vi'

export EDITOR=vim
export HISTSIZE=8000
# Avoid OSX's tar to add dot underscore (._) files when creating archives.
export COPYFILE_DISABLE=true
# Geoip
function geoip_curl_xml { curl -D - http://freegeoip.net/xml/$1; }
alias geoip=geoip_curl_xml
