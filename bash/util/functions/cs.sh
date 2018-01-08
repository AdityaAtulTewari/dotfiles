# Run ls after cd

cs () {
    custom_cd "$@" &&
    timeout 1s ls $LS_COLOR_OPT
}
