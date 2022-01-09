#!/usr/bin/env zsh
#
# +-------------------------------------------------------------------------+
# | ~/config/zsh/rc.d/03-prompt.zsh                                         |
# +-------------------------------------------------------------------------+
# | Copyright © 2021 TTI, Inc.                                              |
# |                  euis.network(at)de.ttiinc.com                          |
# |                                                                         |
# +-------------------------------------------------------------------------+

# Git Info for RPROMPT
setopt prompt_subst
autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' unstagedstr '!'
zstyle ':vcs_info:*' stagedstr '+'
zstyle ':vcs_info:git*' formats "%b %F{green}%m%u%c"
zstyle ':vcs_info:git*+set-message:*' hooks git-untracked
+vi-git-untracked() {
  if [[ $(git rev-parse --is-inside-work-tree 2> /dev/null) == 'true' ]] && \
     git status --porcelain | grep -m 1 '^??' &>/dev/null
  then
    hook_com[misc]='?'
  fi
}

case $(/bin/ps -o comm= -p $PPID) in
    sshd)
        case $TERM in
            xterm|xterm*)
                PROMPT='[%n@%m]%~%# '
                RPROMPT=' %T'
                ;;
            st|st-256color|tmux|tmux-256color)
                precmd() {
                    exitcode="$?"
                    split=3
                    workingdir=" $(pwd | sed 's@'"$HOME"'@~@')"
                    
                    if [[ ${exitcode} -eq 0 ]]; then
                        exitsymbol=" "
                    else
                        exitsymbol=" "
                    fi

                    if [[ $(id -u) = 0 ]]; then
                        usersymbol=" "
                    else
                        usersymbol=" "
                    fi

                    W=${workingdir}
                    if [[ $(echo ${W} | grep -o '/' | wc -l) -gt ${split} ]]; then
                        workingdir=$(echo $W | cut -d'/' -f1-$split | xargs -I{} echo {}"/../${W##*/}")
                    fi

                    PROMPT="%F{255}%K{53}${usersymbol}"
                    PROMPT+="%n@%m"
                    PROMPT+="%F{53}%K{91}"
                    PROMPT+="%F{255}%K{91}${workingdir}"
                    PROMPT+="%F{91}%K{140}"
                    PROMPT+="${exitsymbol}"
                    PROMPT+="%F{140}%k%f%k "
                    vcs_info
                    RPROMPT='%F{140}%F{91}%K{140} %T%F{91}%F{255}%K{91}%B${vcs_info_msg_0_}%b%F{53}%F{255}%K{53} %E'
                }
                ;;
        esac
        ;;
    su)
        case $TERM in
            xterm|xterm*)
                PROMPT='[%n@%m]%~%# '
                RPROMPT=' %T'
                ;;
            st|st-256color|tmux|tmux-256color)
                precmd() {
                    exitcode="$?"
                    split=3
                    workingdir=" $(pwd | sed 's@'"$HOME"'@~@')"
                    
                    if [[ ${exitcode} -eq 0 ]]; then
                        exitsymbol=" "
                    else
                        exitsymbol=" "
                    fi

                    if [[ $(id -u) = 0 ]]; then
                        usersymbol=" "
                    else
                        usersymbol=" "
                    fi

                    W=${workingdir}
                    if [[ $(echo ${W} | grep -o '/' | wc -l) -gt ${split} ]]; then
                        workingdir=$(echo $W | cut -d'/' -f1-$split | xargs -I{} echo {}"/../${W##*/}")
                    fi

                    PROMPT="%F{255}%K{53}${usersymbol}"
                    PROMPT+="%n@%m"
                    PROMPT+="%F{53}%K{91}"
                    PROMPT+="%F{255}%K{91}${workingdir}"
                    PROMPT+="%F{91}%K{140}"
                    PROMPT+="${exitsymbol}"
                    PROMPT+="%F{140}%k%f%k "
                    vcs_info
                    RPROMPT='%F{140}%F{91}%K{140} %T%F{91}%F{255}%K{91}%B${vcs_info_msg_0_}%b%F{53}%F{255}%K{53} %E'
                }
                ;;
        esac
        ;;
    login)
        PROMPT='[%n@%m]%~%# '
        RPROMPT=' %T'
        ;;
    *)
        PROMPT='[%n@%m]%~%# '
        RPROMPT=' %T'
        ;;
esac
