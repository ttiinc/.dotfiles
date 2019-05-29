#!/bin/sh
#
# +-------------------------------------------------------------------------+
# | setup.sh                                                                |
# +-------------------------------------------------------------------------+
# | Copyright © 2019 TTI, Inc.                                              |
# |                  euis.network(at)de.ttiinc.com                          |
# +-------------------------------------------------------------------------+

backupdir=~/Backup.dotfiles.$$
cdir=$(pwd)

while :
do
    printf "\n Install .dotfiles?  >> "
    read antwoord
    case $antwoord in
        [yY] | [yY][Ee][Ss] )
            printf "\n Installing .dotfiles to your home directory."
            printf "\n Your current .dotfiles will be moved to $backupdir"
            mkdir $backupdir
            declare -a files=( ".vimrc" ".bashrc" ".bash_profile" ".bash_logout" ".bash_functions" ".screenrc" ".tmuxrc" ".motd" "template.sh" "template.php" )
            for i in "${files[@]}"
            do
                if [ -f ~/$i ]; then
                    printf "\n Moving $i to $backupdir"
                    mv ~/$i $backupdir
                fi
                printf "\n Creating $i"
                cp ${cdir}/${i} ~
            done
            break
            ;;
        [nN] | [n|N][O|o] )
            printf "\n Oh Boy, you should reconsider your decision."
            break
            ;;
        *)
            printf "\n Wut?\n\n"
            ;;
    esac
done

while :
do
    printf "\n\n Install ~/bin? >> "
    read antwoord
    case $antwoord in
        [yY] | [yY][Ee][Ss] )
            printf "\n Installing bin directory to your home directory."
            mkdir -p ~/.local/bin
            cp ${cdir}/.local/bin/* ~/.local/bin
            break
            ;;
        [nN] | [n|N][O|o] )
            printf "\n Oh Boy, you should reconsider your decision."
            break
            ;;
        *)
            printf "\n Wut?\n\n"
            ;;
    esac
done
printf "\n\n I'm done\n\n"
exit 0
