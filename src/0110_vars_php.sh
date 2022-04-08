function php_version_get_hint() {
    local php_version
    php_version=$(get_hint_php_version)

    if [ -z "$php_version" ]; then
        if command -v php &>/dev/null; then
            php_version=$(php -r "echo PHP_VERSION;")
        else
            php_version="unknown"
        fi
    fi

    echo "$php_version"
}

function php_version_input() {
    local hint_string
    hint_string="$(php_version_get_hint)"

    local php_version

    if [ "$INTERACTIVE" = 1 ]; then
        read -rp "PHP version [$hint_string]: " php_version
    fi

    php_version=${php_version:-$hint_string}

    echo "$php_version"
}

input_data_add "%{{PHP_VERSION}}%" "$(php_version_input)"

if [ "$INTERACTIVE" = 0 ]; then
    echo "PHP version: $(input_data_get_value "%{{PHP_VERSION}}%")"
fi
