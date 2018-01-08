# options.sh - define shell options

# Spell correct arguments to cd
shopt -s cdspell
# Append to the history file, don't overwrite it
shopt -s histappend
# Keep multiline commands as one command in history
shopt -s cmdhist
# Check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize
# Set * wildcard to expand to blank when nothing matched rather than "*"
# shopt -s nullglob
# Enter commands using vim mode
set -o vi
