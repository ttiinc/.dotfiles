#!/usr/bin/env bash
#
# +-------------------------------------------------------------------------+
# | ~/.config/bash/rc.d/03-env.bash                                         |
# +-------------------------------------------------------------------------+
# | Copyright © 2019 TTI, Inc.                                              |
# |                  euis.network(at)de.ttiinc.com                          |
# +-------------------------------------------------------------------------+

export PATH=$PATH:$HOME/.local/bin
export EDITOR=vi
export HISTSIZE=1000
export HISTFILESIZE=2000
export HISTFILE=~/.config/bash/.bash_history
# export GIT_AUTHOR_NAME="Your Name"
# export GIT_COMMITTER_NAME="Your Name"

shopt -s histappend
shopt -s checkwinsize
shopt -q -s cdspell
