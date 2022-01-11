#!/usr/bin/env zsh
#
# +-------------------------------------------------------------------------+
# | ~/config/zsh/rc.d/04-alias.zsh                                          |
# +-------------------------------------------------------------------------+
# | Copyright © 2021 TTI, Inc.                                              |
# |                  euis.network(at)de.ttiinc.com                          |
# |                                                                         |
# +-------------------------------------------------------------------------+

if ! type "exa" &> /dev/null; then
    alias l='exa -lghm --group-directories-first --git'
    alias ll='exa -laghm --group-directories-first --git'
else
    alias l='LC_ALL=C ls --color=auto --group-directories-first -lh'
    alias ll='LC_ALL=C ls --color=auto --group-directories-first -lah'
fi

if ! type "vim" &> /dev/null; then
    alias vi='vim'
fi

alias grep='grep -i --color=auto'
alias s='su - root'
alias cp='cp -ir'
alias rm='rm -rf'
alias mkdir='mkdir -p'
alias ..='cd ..'
alias ...='cd ../..'
