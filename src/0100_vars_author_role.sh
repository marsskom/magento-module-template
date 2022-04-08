function author_role_get_hint() {
    local author_role
    author_role=$(get_hint_author_role)

    echo "$author_role"
}

function author_role_input() {
    local hint_string
    hint_string="$(author_role_get_hint)"

    local author_role

    if [ "$INTERACTIVE" = 1 ]; then
        read -rp "Your role [$hint_string]: " author_role
    fi

    author_role=${author_role:-$hint_string}

    echo "$author_role"
}

input_data_add "%{{AUTHOR_ROLE}}%" "$(author_role_input)"

if [ "$INTERACTIVE" = 0 ]; then
    echo "Role: $(input_data_get_value "%{{AUTHOR_ROLE}}%")"
fi
