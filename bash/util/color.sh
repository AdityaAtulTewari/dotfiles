# colors.sh - define shortcuts for terminal colors

# Prompt colors
# High Intensity
iblack='\[\e[0;90m\]'       # Black
ired='\[\e[0;91m\]'         # Red
igreen='\[\e[0;92m\]'       # Green
iyellow='\[\e[0;93m\]'      # Yellow
iblue='\[\e[0;94m\]'        # Blue
ipurple='\[\e[0;95m\]'      # Purple
icyan='\[\e[0;96m\]'        # Cyan
iwhite='\[\e[0;97m\]'       # White
# Regular
black='\[\e[0;30m\]'        # Black
red='\[\e[0;31m\]'          # Red
green='\[\e[0;32m\]'        # Green
yellow='\[\e[0;33m\]'       # Yellow
blue='\[\e[0;34m\]'         # Blue
purple='\[\e[0;35m\]'       # Purple
cyan='\[\e[0;36m\]'         # Cyan
white='\[\e[0;37m\]'        # White
# Reset
no_color='\[\e[0m\]'
#Additional colors by Jake Zimmerman
#
# Usage:
#   Once you've sourced this file,
#
#       echo "This word is${cblue}blue${cnone} :D"
#
#   This works anywhere that shell variables are expanded.

# ANSI colors
export cnone="$(echo -ne '\033[0m')"
export cwhiteb="$(echo -ne '\033[1;37m')"
export cwhite="$(echo -ne '\033[0;37m')"
export cgray="$(echo -ne '\033[1;30m')"
export cblack="$(echo -ne '\033[0;30m')"

export cred="$(echo -ne '\033[0;31m')"
export credb="$(echo -ne '\033[1;31m')"
export cgreen="$(echo -ne '\033[0;32m')"
export cgreenb="$(echo -ne '\033[1;32m')"
export cyellow="$(echo -ne '\033[0;33m')"
export cyellowb="$(echo -ne '\033[1;33m')"
export cblue="$(echo -ne '\033[0;34m')"
export cblueb="$(echo -ne '\033[1;34m')"
export cmagenta="$(echo -ne '\033[0;35m')"
export cmagentab="$(echo -ne '\033[1;35m')"
export ccyan="$(echo -ne '\033[0;36m')"
export ccyanb="$(echo -ne '\033[1;36m')"

# Solarized 256 colors
export sred="$(echo -ne '\033[00;38;5;160m')"
export sorange="$(echo -ne '\033[00;38;5;166m')"
export syellow="$(echo -ne '\033[00;38;5;136m')"
export sgreen="$(echo -ne '\033[00;38;5;64m')"
export sblue="$(echo -ne '\033[00;38;5;33m')"
export spurple="$(echo -ne '\033[00;38;5;61m')"
export sbgray="$(echo -ne '\033[01;38;5;245m')"
export slgray="$(echo -ne '\033[00;38;5;244m')"
export sfaint="$(echo -ne '\033[00;38;5;240m')"
export swhite="$(echo -ne '\033[00;38;5;15m')"
export sreset="$(echo -ne '\033[0m')"

# Utility function to pick any xterm-256 color
# Usage:
#   $(color256 fg attr bg)
#   fg - 256 xterm color code
#   attr - one of:
#        - 00=none 01=bold 04=underscore 05=blink 07=reverse 08=concealed
#   bg - 256 xterm color code
# You may omit either (bg) or (style and bg)
function color256 () {
  if [ -z $3 ]; then echo -ne "\033[$2;48;5;$3;38;5;$1m"; return; fi
  if [ -z $2 ]; then echo -ne "\033[$2;38;5;$1;40m"; return; fi
  if [ -z $1 ]; then echo -ne "\033[0;38;5;$1;40m"; return; fi
}
