while getopts s:d: option; do
    case "${option}" in

    s) DIR_SOURCE=${OPTARG} ;;
    d) DIR_DESTINATION=${OPTARG} ;;
    esac
done

DIR_SOURCE=${DIR_SOURCE:-0}
DIR_DESTINATION=${DIR_DESTINATION:-0}

if [ "$DIR_SOURCE" = 0 ]; then
    echo "Source dir (-s) is required! By default set path to [tpl] dir."
    exit 1
fi

if [ "$DIR_DESTINATION" = 0 ]; then
    echo "Destination dir (-d) is required!"
    exit 1
fi

SCRIPT_PATH="$(dirname "$0")"
