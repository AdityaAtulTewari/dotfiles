# Run ls after cd

cs () {
    custom_cd "$@" &&
    ls --color=always
}
