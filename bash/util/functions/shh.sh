# Snark for ssh typos, in the vein of sl

shh() {
  if [ "$#" -gt 0 ]
  then
    echo $(echo "$1" | cut -d "@" -f 1) "has been quieted"
  else
      echo "who would you like to quiet?"
  fi
}
