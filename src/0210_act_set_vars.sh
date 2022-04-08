function set_vars() {
    for i in "${INPUT_DATA[@]}"; do
        readarray -d "$INPUT_DATA_SEPARATOR" -t strarr <<<"$i"

        local key
        key=${strarr[0]//[$'\t\r\n']/}

        local value
        value=${strarr[1]//[$'\t\r\n']/}
        value="${value%\"}"
        value="${value#\"}"
        value=$(printf '%s\n' "$value" | sed -e 's/[\/&]/\\&/g')

        find "$(actions_get_dest_dir)" \( -type d -name .git -prune \) -o -type f -print0 | xargs -0 sed -i "s/$key/$value/g"
    done
}

function set_license_text() {
    local license_text
    license_text=$(license_get_text "$(license_load "$(input_data_get_value "%{{LICENSE_SET}}%")")")
    license_text="${license_text%\"}"
    license_text="${license_text#\"}"

    echo -en "$license_text" >"$(actions_get_dest_dir)/LICENSE.txt"
}

set_vars
set_license_text
