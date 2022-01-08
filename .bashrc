#!/bin/sh
#
# +-------------------------------------------------------------------------+
# | .bashrc                                                                 |
# +-------------------------------------------------------------------------+
# | Copyright © 2019 TTI, Inc.                                              |
# |                  euis.network(at)de.ttiinc.com                          |
# +-------------------------------------------------------------------------+



echo ".bashrc 1"

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

umask 002
BASH_DIRECTORY=$HOME/.config/bash


for file in $BASH_DIRECTORY/rc.d/*.bash; do
    source $file
done





# case $(/bin/ps -o comm= -p $PPID) in
#     sshd)
#         export PS1="\n┌[\u@\h]──[\w]──[\@]\n└────╼ "
#         # small_pacman
#         hostfetch
#         ;;
#     urxvt|st|st-256color|xterm*|rxvt*|Eterm*|aterm|kterm|gnome*|interix|konsole*)
#         export PS1="\[\e[38;5;255;48;5;53m\] \u@\h\[\e[38;5;53;48;5;91m\]\[\e[38;5;255;48;5;91m\] \w\[\e[38;5;91;48;5;140m\]\[\e[38;5;256;48;5;140m\]\@\[\e[0m\[\e[38;5;140m\[\e[m\] "
#         # fancy_pacman
#         hostfetch
#         ;;
#     login)
#         export PS1="\n┌[\u@\h]──[\w]──[\@]\n└────╼ "
#         # tiny_pacman
#         hostfetch
#         printf "\n\n [Oh Boy, get on a graphical shell!]\n"
#         ;;
# esac


if [ -f ~/.motd ]; then
    /bin/cat ~/.motd
fi

echo ".bashrc 1"
