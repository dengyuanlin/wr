#!/usr/bin/env bash

#echo "loading .bashrc"
#umask 002

####################################################
# Configure PS1
# git branch && PS 1
function curr_git_branch {
  local branch=`git symbolic-ref HEAD 2>/dev/null | cut -d"/" -f 3`
  if [ $branch ]; then echo " $branch"; fi
}
PS1='[\u@\H \e[0;33m\w\e[0m\e[0;32m$(curr_git_branch)\e[0m]\n\$'


#####################################################
# Configurations for cross servers
#
if [ `hostname` == "ctu-testbuild1" ]; then                                      
    export my_vx7_WORKSPACEs="/ctu-testbuild1_01/buildarea1/gdong/vx7-repositories/vx7-cert-push:/ctu-testbuild1_01/buildarea1/gdong/vx7-repositories/vx7-cert-push-debug"
elif [ `hostname` == "ctu-testbuild2" ]; then                                    
    export my_vx7_WORKSPACEs="/ctu-testbuild2_01/buildarea/gdong/vx7-repositories/vx7-cert-push"
elif [ `hostname` == "ctu-simics1" ]; then
    export my_vx7_WORKSPACEs="/opt/ctu-simics1/ydeng/vx7-cert-push"
elif [ `hostname` == "ctu-simics2" ]; then
    export my_vx7_WORKSPACEs="/opt/ctu-simics2/ydeng/vx7-cert-push"
fi


#####################################################
# Alias
#
alias ll='ls -al'
alias h='history'

source /folk/ctu-git/tools/common/public_alias.sh
source /folk/ctu-git/tools/vx7/public_alias.sh


if [ -e ~/bashrc_debug ]; then
    source ~/bashrc_debug
fi

# load env
[ "$WIND_BASE" == "" ] && load.vx7_env 1

