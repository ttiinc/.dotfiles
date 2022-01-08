#!/usr/bin/env bash
#
# +-------------------------------------------------------------------------+
# | ~/.config/bash/rc.d/04-prompt.bash                                      |
# +-------------------------------------------------------------------------+
# | Copyright © 2019 TTI, Inc.                                              |
# |                  euis.network(at)de.ttiinc.com                          |
# +-------------------------------------------------------------------------+

case $(/bin/ps -o comm= -p $PPID) in
    sshd)
        case $TERM in
            xterm|xterm*|st|st-256color|tmux|tmux-256color)
            export PROMPT_COMMAND=prompt_command_fancy
        esac
    ;;
    login)
        export PROMPT_COMMAND=prompt_command_tiny
    ;;
    *)
        export PROMPT_COMMAND=prompt_command_failsafe
    ;;
esac
