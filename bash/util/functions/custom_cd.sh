# Track most recently entered directory and silence CDPATH output

custom_cd() {
    cd "$@" > /dev/null &&
    pwd > ~/.last_cd
}

