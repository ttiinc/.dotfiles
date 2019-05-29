#!/bin/sh
#
# +-------------------------------------------------------------------------+
# | .bashrc                                                                 |
# +-------------------------------------------------------------------------+
# | Copyright © 2019 TTI, Inc.                                              |
# |                  euis.network(at)de.ttiinc.com                          |
# +-------------------------------------------------------------------------+

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

umask 002
. ~/.bash_functions
export PATH=$HOME/.local/bin:/usr/lib64/qt-3.3/bin:/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin:/root/bin
export EDITOR=vi
export HISTSIZE=1000
export HISTFILESIZE=2000
export HISTFILE=~/.bash_history
# export GIT_AUTHOR_NAME="Your Name"
# export GIT_COMMITTER_NAME="Your Name"

shopt -s histappend
shopt -s checkwinsize
shopt -q -s cdspell

case $(/bin/ps -o comm= -p $PPID) in
    sshd)
        export PS1="\n┌[\u@\h]──[\w]──[\@]\n└────╼ "
        small_pacman
        ;;
    urxvt|st|st-256color|xterm*|rxvt*|Eterm*|aterm|kterm|gnome*|interix|konsole*)
        export PS1="\[\e[38;5;255;48;5;53m\] \u@\h\[\e[38;5;53;48;5;91m\]\[\e[38;5;255;48;5;91m\] \w\[\e[38;5;91;48;5;140m\]\[\e[38;5;256;48;5;140m\]\@\[\e[0m\[\e[38;5;140m\[\e[m\] "
        # fancy_pacman
        hostfetch
        ;;
    login)
        export PS1="\n┌[\u@\h]──[\w]──[\@]\n└────╼ "
        tiny_pacman
        printf "\n\n [Oh Boy, get on a graphical shell!]\n"
        ;;
esac

# User specific aliases and functions
alias vi='TERM=xterm /usr/bin/vim -X' 2>/dev/null
alias l='LC_ALL=C /bin/ls --color=auto --group-directories-first -lah' 2>/dev/null
alias ll='/bin/ls --color=auto --group-directories-first -lah | more' 2>/dev/null
alias grep='grep -i --color=auto' 2>/dev/null
alias s='su - root' 2>/dev/null
alias cp='cp -ir' 2>/dev/null
alias rm='rm -rf' 2>/dev/null

if [ -f ~/.motd ]; then
    /bin/cat ~/.motd
fi

