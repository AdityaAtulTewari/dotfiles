# after.sh - misc config which must happen after the interactivity check

# Add all bin folders and the current directory to the PATH
export PATH=~/bin:/usr/local/bin:/bin:/usr/bin:/usr/local/sbin:$PATH
# Set editor preference
export EDITOR='/usr/bin/vim'
# Define the trash folder location
export TRASH=~/.Trash
# Add parent, home, and root to CDPATH. DO NOT EXPORT: it may break scripts
CDPATH=.:..:~:/:$CDPATH

# Make .bash_history store more and not store duplicates
export HISTCONTROL=ignoreboth
export HISTSIZE=250000
export HISTFILESIZE=250000

# Add a preview pane to fzf's ctrl-t search
export FZF_CTRL_T_OPTS="--preview '(highlight -O xterm256 -l {} 2> /dev/null \
  || cat {} || tree -C {}) 2> /dev/null | head -200'"

# Make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe.sh ] && export LESSOPEN="|/usr/bin/lesspipe.sh %s"

# Enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

bind "set completion-ignore-case on"

# Change scp to use the default completion option because otherwise it won't
# do case insensitive completeion for some reason
complete -o default -F _fzf_path_completion scp

# Complete cd arguments only using the current directory. If nothing matches,
# use the whole CDPATH.
if command -v _cd &> /dev/null; then
    _custom_cd () {
        CDPATH="" _cd "$@"
        if [ -z "$COMPREPLY" ]
        then
            _cd "$@"
        fi
    }
    complete -F _custom_cd -o nospace cd
fi

