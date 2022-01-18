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
BASH_DIRECTORY=$HOME/.config/bash


for file in $BASH_DIRECTORY/rc.d/*.bash; do
    source $file
done

if [ -f ~/.motd ]; then
    /bin/cat ~/.motd
fi
