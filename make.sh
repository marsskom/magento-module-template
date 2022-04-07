#!/usr/bin/env bash
while getopts v:d:s: option; do
    case "${option}" in

    v) DEBUG=${OPTARG} ;;
    d) SRC_DIR=${OPTARG} ;;
    s) SCRIPT_FILENAME=${OPTARG} ;;
    esac
done

DEBUG=${DEBUG:-0}
SRC_DIR=${SRC_DIR:-"./src"}
SCRIPT_FILENAME=${SCRIPT_FILENAME:-"./bin/script.sh"}

# Function reads files in directory recursively.
find_files() {
    if [[ ! -x "$1" ]]; then
        echo "$1 isn't a directory" >&2
        return 1
    fi

    local dirs=("$1")

    while [[ "${#dirs[@]}" -gt 0 ]]; do
        local dir="${dirs[0]}"
        dirs=("${dirs[@]:1}") # pop the element from above

        # whitespace in filenames iterated will be a problem. Look to the IFS
        # variable to handle those more gracefully.
        for p in "${dir}"/*; do
            if [[ -d "$p" ]]; then
                dirs+=("$p")
            elif [[ -f "$p" ]]; then
                echo "$p"
            fi
        done
    done
}

# Adds debug info.
debug_info() {
    if [ "$DEBUG" = 0 ]; then
        return 1
    fi

    echo "$1: '$2'"

    if [ "$1" = "START" ]; then
        printf "\n" >>"$SCRIPT_FILENAME"
    fi

    printf "# $1: --- '$2' ---\n" >>"$SCRIPT_FILENAME"
}

# Removes old file.
[ -e "$SCRIPT_FILENAME" ] && rm "$SCRIPT_FILENAME"

# Creates script file.
printf "#!/usr/bin/env bash\n" >"$SCRIPT_FILENAME"

for f in $(find_files "$SRC_DIR"); do
    debug_info "START" $f
    cat "$f" >>"$SCRIPT_FILENAME"
    debug_info "END" $f
done

# Sets executable.
chmod +x "$SCRIPT_FILENAME"
