function author_email_get_hint() {
    local author_email
    author_email=$(get_hint_author_email)

    if [ -z "$author_email" ]; then
        author_email=$(git config --get user.email)
    fi

    echo "$author_email"
}

function author_email_input() {
    local hint_string
    hint_string="$(author_email_get_hint)"

    local author_email

    if [ "$INTERACTIVE" = 1 ]; then
        read -rp "Enter your email [$hint_string]: " author_email
    fi

    author_email=${author_email:-$hint_string}

    echo "$author_email"
}

input_data_add "%{{AUTHOR_EMAIL}}%" "$(author_email_input)"

if [ "$INTERACTIVE" = 0 ]; then
    echo "Email: $(input_data_get_value "%{{AUTHOR_EMAIL}}%")"
fi
