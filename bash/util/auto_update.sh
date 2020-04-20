#
# auto_update.sh - check for updates (to anything) regularly
#
# Can be used for things like checking if dotfiles repos have new changes, if
# package managers have updates, renewing credentials, etc.
#
# Author
#   Jake Zimmerman <jake@zimmerman.io>
# Modified by
#   Michael Murphy <mjmurphy@cmu.edu>
# # Usage #   - Requires my colors.sh to have been sourced already for colorized output
#   - source this file to check if the "system is out of date" (i.e., hasn't
#     been updated in UPDATE_THRESHOLD seconds)
#   - call `update` to run general update checks and checks defined by the
#     system
#     - define a function `update-host` and bind it to the environment before
#       calling update!
#
# Notes
#   This file will only check for updates every time it's sourced. It's meant
#   to be sourced in a bashrc or zshrc so that every time you open a new tab or
#   pane it reminds you if you haven't updated in a while. It neither checks
#   continuously for updates, nor fetches the updates themselves.
#
# TODOs
#   Maybe some day I'll turn this into a fully-configurable file, but for now
#   most things are hard coded.

# Get seconds since unix epoch
unix_time() {
  date +%s
}

# Number of seconds to wait before printing a reminder
UPDATE_THRESHOLD="86400"
# File to record the unix time when update was last run
last_update=$HOME/.last_update

# If there is no timestamp recorded, assume it is 0 (forever ago)
if [ ! -e "$last_update" ]
then
  echo 0 > "$last_update"
fi

last_check=$(cat "$last_update")
time_now=$(unix_time)

time_since_check=$((time_now - last_check))

if [ "$time_since_check" -ge "$UPDATE_THRESHOLD" ]; then
  echo "$cred==>$cwhiteb Your system is out of date!$cnone"
  echo 'Run `update` to bring it up to date.'
fi

# update - fetch updates
# usage:
#   update
#
# You will likely also want to define a function `update-host` for each host
# that you will run `update` from. Ensure that this function is sourced before
# calling `update`.
update() {
  # Record that we've update
  echo $(unix_time) > "$last_update"

  # --- Host-independent updates ---

  # Update dotfiles repo
  pushd ~/.dotfiles/
  git stash
  echo "$cblueb==>$cwhiteb Updating dotfiles...$cnone"
  git fetch --quiet origin
  if [ "$(git rev-parse HEAD)" != "$(git rev-parse origin/master)" ]; then echo "$credb  --> outdated."; fi
  git pull
  git stash pop
  # Update vim plugins
  vim -c ":PlugUpdate" -c ":wqa" ~/.vimrc

  # --- Host-dependent updates ---
  os_update

  
  popd

}


