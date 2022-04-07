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

# Adds debug info.
function debug_info() {
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
find ./src -type f -name "*.sh" -printf "%p\n" | sort -t _ -n | cut -d ' ' -f1- | while read file; do
    debug_info "START" "$file"
    cat "$file" >>"$SCRIPT_FILENAME"
    debug_info "END" "$file"
done

# Copies vendor scripts.
cp -R ./vendor/* ./bin/

# Sets executable.
chmod +x ./bin/*.sh
