function code_owner_get_hint() {
    local code_owner
    code_owner=$(get_hint_codeowner)

    echo "$code_owner"
}

function code_owner_input() {
    local hint_string
    hint_string="$(code_owner_get_hint)"

    local code_owner

    if [ "$INTERACTIVE" = 1 ]; then
        read -rp "Code Owner [$hint_string]: " code_owner
    fi

    code_owner=${code_owner:-$hint_string}

    echo "$code_owner"
}

input_data_add "%{{CODE_OWNER}}%" "$(code_owner_input)"

if [ "$INTERACTIVE" = 0 ]; then
    echo "Code Owner: $(input_data_get_value "%{{CODE_OWNER}}%")"
fi
