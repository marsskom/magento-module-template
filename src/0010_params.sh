while getopts s:d:f:n: option; do
    case "${option}" in

    s) DIR_SOURCE=${OPTARG} ;;
    d) DIR_DESTINATION=${OPTARG} ;;
    f) INPUT_FILE=${OPTARG} ;;
    n) NON_INTERACTIVE=${OPTARG} ;;
    esac
done

declare SCRIPT_PATH
SCRIPT_PATH="$(dirname "$0")"

declare DIR_SOURCE=${DIR_SOURCE:-"$SCRIPT_PATH/../tpl/"}
declare DIR_DESTINATION=${DIR_DESTINATION:-0}
declare INPUT_FILE=${INPUT_FILE:-0}
declare NON_INTERACTIVE=${NON_INTERACTIVE:-0}

declare -i INTERACTIVE
if [ "$NON_INTERACTIVE" = 0 ]; then
    INTERACTIVE=1
else
    INTERACTIVE=0
fi

if [ "$DIR_SOURCE" = 0 ]; then
    echo "Source dir [-s] is required! By default set path to [tpl] dir."
    exit 1
fi

if [ "$DIR_DESTINATION" = 0 ]; then
    echo "Destination dir [-d] is required!"
    exit 1
fi

if [ ! "$INPUT_FILE" = 0 ] && [ ! -e "$INPUT_FILE" ]; then
    echo "You set wrong path to ini file [-f]!"
    exit 1
fi

if [ "$INPUT_FILE" = 0 ] || [ ! -e "$INPUT_FILE" ]; then
    if [ "$NON_INTERACTIVE" = 1 ]; then
        echo "You cannot use non-interactive mode [-n] without ini file!"
        exit 1
    fi
fi
