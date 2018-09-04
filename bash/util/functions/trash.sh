# Move files to a trash folder rather than permanently deleting

trash() {
    local verbose=false

    local OPTIND opt
    while getopts ":vh" opt
    do
        case $opt in
            v)
                verbose=true
                ;;
            h)
                echo "Usage: trash [OPTION]... FILE..."
                echo "Move FILE(s) to the trash."
                echo
                echo "  -v    explain what is being done"
                echo "  -h    display this help message and exit"
                return 0
                ;;
            \?)
                echo "trash: invalid option -- '$OPTARG'" >&2
                echo "Try \`trash -h' for more information."
                return 1
                ;;
        esac
    done

    if [ "$verbose" = "true" ]
    then
        shift
    fi

    if [ "$#" -lt 1 ]
    then
        echo "trash: missing operand"
        echo "Try \`trash -h' for more information."
        return 1
    fi

    if [ ! -d "$TRASH" ]
    then
        mkdir -v "$TRASH"
    fi &&

    for arg in "$@"
    do
        if [ -e "$arg" ]
        then
            local file=$(basename "$arg") &&
            if [ -e "$TRASH/$file" ]
            then
                local date="_$(date +%F.%T)" &&
                mv -i "$arg" "$TRASH/$file"$date
            else
                mv -i "$arg" "$TRASH/$file"
            fi &&

            if [ "$verbose" = "true" ]
            then
                echo "trashed" '`'"$arg""'"
            fi
        else
          echo "trash: $arg: No such file or directory"
        fi
    done
}

