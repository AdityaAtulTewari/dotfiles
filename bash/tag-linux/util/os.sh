# os.sh - os specific config for Linux

eval "$(ssh-agent -s)" > /dev/null

# Mac and Linux use different color options.
# This is used in ls aliases and in the cs function.
export LS_COLOR_OPT="--color=auto"

alias "rm"="rm -Iv" # Make rm safe and verbose

# cd by just typing the directory name
shopt -s autocd
# Check for running or stopped jobs before exiting
shopt -s checkjobs
# Spell correct autocomplete of directories
shopt -s dirspell
# Expand variables using tab
shopt -s direxpand

# Run the keyring agent
eval $(gnome-keyring-daemon --start)
