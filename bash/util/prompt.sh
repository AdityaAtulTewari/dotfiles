# prompt.sh - command and helpers to create the PS1 prompt

# Git prompt
source ~/.git-prompt.sh
export GIT_PS1_SHOWUPSTREAM="auto git" # Add verbose to see number of commits
export GIT_PS1_STATESEPARATOR='|'
#export GIT_PS1_SHOWDIRTYSTATE=true
#export GIT_PS1_SHOWSTASHSTATE=true
#export GIT_PS1_SHOWUNTRACKEDFILES=true
#export GIT_PS1_SHOWCOLORHINTS=true # Only works if PROMPT_COMMAND=__git_ps1

time_jobs=$iyellow'\A'$iwhite'|'$ired'\j'$iwhite'|'
user_host_wd=$icyan'\u'$iwhite'@'$iblue'\h'$iwhite':'$ipurple'\w'

prompt() {
    if [ $? = 0 ]
    then
        local dollar=$igreen'\n$ '
    else
        local dollar=$ired'\n$ '
    fi

    if [ "$COW_PROMPT" = true ]
    then
        /bin/fortune | ~/bin/cowsay -n
    fi

    local git_color=$icyan
    local git_status=$git_color$(__git_ps1 | cut -c 2-)
    local git_status=${git_status/"%"/$icyan"%"$git_color}
    local git_status=${git_status/"*"/$ired"*"$git_color}
    local git_status=${git_status/"+"/$iyellow"+"$git_color}
    local git_status=${git_status/"$"/$ipurple"$"$git_color}
    local git_status=${git_status//"("/$iwhite"("$git_color}
    local git_status=${git_status//")"/$iwhite")"$git_color}

    local virtualenv=$(basename "$VIRTUAL_ENV")
    if [ -n "$virtualenv" ]
    then
        local virtualenv=$iwhite'('$icyan$virtualenv$iwhite')'
    fi

    export PS1=$time_jobs$user_host_wd$git_status$virtualenv$dollar$no_color
}
export PROMPT_COMMAND=prompt
