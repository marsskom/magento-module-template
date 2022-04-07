input_data_get_value() {
    for i in "${INPUT_DATA[@]}"; do
        readarray -d "$INPUT_DATA_SEPARATOR" -t strarr <<<"$i"
        if [ "$1" = "${strarr[0]}" ]; then
            echo "${strarr[1]}"
        fi
    done
}

input_data_add() {
    INPUT_DATA+=("$1$INPUT_DATA_SEPARATOR$2")
}
