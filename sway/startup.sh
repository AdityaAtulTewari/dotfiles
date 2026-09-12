SLEEP=5

mkdir -p /tmp/startup/

open_on_workspace() {
  swaymsg workspace number $1
  if [ ! -f /tmp/startup/$2 ]; then
    swaymsg "exec $3"
    touch /tmp/startup/$2
    sleep $4
  fi
}

open_on_workspace 9 firefox firefox 5
open_on_workspace 6 librewolf librewolf 5
open_on_workspace 5 reviewer foot 2
open_on_workspace 2 main foot 2
open_on_workspace 1 signal signal-desktop 0
open_on_workspace 1 slack slack 0
open_on_workspace 1 discord discord 0
swaymsg layout tabbed
