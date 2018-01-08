# Run ls after cd

cs () {
    custom_cd "$@" &&
    timeout 1s ls --color=always
}
