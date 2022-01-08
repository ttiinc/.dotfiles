#!/usr/bin/env bash
#
# +-------------------------------------------------------------------------+
# | ~/.config/bash/rc.d/03-alias.bash                                       |
# +-------------------------------------------------------------------------+
# | Copyright © 2019 TTI, Inc.                                              |
# |                  euis.network(at)de.ttiinc.com                          |
# +-------------------------------------------------------------------------+


if command -v exa &> /dev/null; then
    alias l='exa -lghm --icons --group-directories-first --git'
    alias ll='exa -laghm --icons --group-directories-first --git'
else
    alias l='LC_ALL=C ls --color=auto --group-directories-first -lh'
    alias ll='LC_ALL=C ls --color=auto --group-directories-first -lah'
fi

alias grep='grep -i --color=auto'
alias s='su - root'
alias cp='cp -ir'
alias rm='rm -rf'
alias mkdir='mkdir -p'
alias ..='cd ..'
alias ...='cd ../..'
