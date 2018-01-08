# Get the absolute path to a file, in the style of basename and dirname

absname() {
  if [ "$#" -gt 0 ]
  then
      dest=$(dirname "$1")
      echo $(cd "$dest"; pwd)/$(basename "$1")
  else
      echo "absname: missing operand"
  fi
}
