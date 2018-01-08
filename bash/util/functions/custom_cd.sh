# Track most recently entered directory and silence CDPATH output

custom_cd() {
    cd "$@" &&
    pwd > ~/.last_cd
}

