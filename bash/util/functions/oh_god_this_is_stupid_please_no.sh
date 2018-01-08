# Alias all commands. This is dumb. Why would you do this.

oh_god_this_is_stupid_please_no() {
  for command in $(compgen -c)
  do
      alias $command="echo YOLOSWAG"
  done
}
