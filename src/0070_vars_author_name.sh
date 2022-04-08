function author_name_get_hint() {
    local author_name
    author_name=$(get_hint_author_name)

    if [ -z "$author_name" ]; then
        author_name=$(git config --get user.name)
    fi

    echo "$author_name"
}

function author_name_input() {
    local hint_string
    hint_string="$(author_name_get_hint)"

    local author_name

    if [ "$INTERACTIVE" = 1 ]; then
        read -rp "Enter your name [$hint_string]: " author_name
    fi

    author_name=${author_name:-$hint_string}

    echo "$author_name"
}

input_data_add "%{{AUTHOR_NAME}}%" "$(author_name_input)"

if [ "$INTERACTIVE" = 0 ]; then
    echo "Name: $(input_data_get_value "%{{AUTHOR_NAME}}%")"
fi
