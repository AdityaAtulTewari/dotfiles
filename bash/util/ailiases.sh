# aliases.sh - define aliases

# Add options to existing commands
alias "cd"="custom_cd" # Use custom cd defined in functions
alias "mv"="mv -iv"      # | Make file manipulations verbose
alias "cp"="cp -iv"      # | rm is in an os specific file
alias "trash"="trash -v" # | because of -I
alias "vim"="vim -p" # Always open in tab mode
alias "grep"='grep --color=auto'
alias "mkrc"="mkrc -v"
alias "rcdn"="rcdn -v"
alias "rcup"="rcup -v"
alias "man"="vman"

# Make ls better
alias "ls"="ls $LS_COLOR_OPT" # Pretty ls
alias "list"="ls -goh $LS_COLOR_OPT" # Pretty long ls
alias "lista"="ls -gohA $LS_COLOR_OPT" # Pretty ls with hiddens

# Wrap REPLs
alias "ocaml"="rlwrap ocaml"
alias "sml"="rlwrap sml"
alias "coin"='rlwrap coin'

# Other shortcuts
alias "rc"="vim ~/.bashrc"
alias "rcrc"="vim ~/.rcrc"
alias "vimrc"="vim ~/.vimrc"
alias "hidden"='ls -A | grep "^\..*" | cat'
alias "usage"="du -hs *"
alias "untar"="tar -xvf"
alias "ungzip"="tar -xzvf"
alias "pyclean"='find . -name "*.pyc" -exec rm {} \;'
alias "wpr"='wget -O >(lpr)'
alias "swp_files"="if [ -e .*.swp ]; then ls .*.swp; else echo 'No swp files!'; fi;"

# If we have `whoami` shouldn't we have the rest?
alias "whereami"='wget -qO- http://ipecho.net/plain ; echo ; hostname -f'
alias "whenami"='date'
alias "whatami"='uname -a'
alias "whyami"='fortune -a'
alias "howami"='echo amused'

# Snark
alias ":wq"="echo 'try C-x C-c'"
alias ":q"="vim"
alias "star_wars"="telnet towel.blinkenlights.nl"
alias "shh_andrew"="shh andrew"
alias "shh_shark"="shh shark"
alias "shh_ghc"=" shh ghc"
