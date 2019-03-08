#!/bin/bash
# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# Source global definitions
if [ -f /etc/bashrc ]; then
        . /etc/bashrc
fi

export SHELL=/bin/bash

function get_hostname {
  export SHORTNAME=${HOSTNAME%%.*}
}

function git_branch() { 
  gitbranch=$(git branch 2>/dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'); 
}

function user_color {
  id | grep "Admin" > /dev/null
  RETVAL=$?
  if [[ $RETVAL == 0 ]]; then
    usercolor="[0;32m";
  else
    usercolor="[0;32m";
  fi
}

function settitle() {
  u=${USERNAME}
  h="$u@${HOSTNAME}"
  echo -ne "\e]2;$h\a\e]1;$h\a";
}

# Set directory colors
eval `dircolors ~/.dir_colors`

# Set prompt and window title
inputcolor='[0;37m'
cwdcolor='[0;34m'
host_name='[1;31m'
user_color
PROMPT_COMMAND='settitle; git_branch; get_hostname; history -a;'
PS1='\n\[\e${cwdcolor}\][${PWD}]\[\e${inputcolor}\]${gitbranch}\n\[\e${usercolor}\][\u]\[\e${host_name}\][${SHORTNAME}]\[\e${inputcolor}\] $ '
export PS1

# Aliases
alias ls='ls -l --color'
alias grep='grep -n --color'
