# Run a grep search and open the results in vim

vim_grep() {
  vim -p $(grep "$@" -l | sort -u | xargs)
}
