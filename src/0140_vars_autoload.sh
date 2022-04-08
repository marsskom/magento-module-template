function composer_autoload_get_hint() {
    local composer_autoload
    composer_autoload=$(get_hint_composer_autoload)

    if [ -z "$composer_autoload" ]; then
        composer_autoload="$(input_data_get_value "%{{M2_VENDOR}}%")\\\\$(input_data_get_value "%{{M2_VENDOR_MODULE}}%")\\\\"
    fi

    echo "$composer_autoload"
}

function composer_autoload_input() {
    local hint_string
    hint_string="$(composer_autoload_get_hint)"

    local composer_autoload

    if [ "$INTERACTIVE" = 1 ]; then
        read -rp "Composer autoload namespace (psr-4) [$hint_string]: " composer_autoload
    fi

    composer_autoload=${composer_autoload:-$hint_string}

    echo "$composer_autoload"
}

input_data_add "%{{COMPOSER_AUTOLOAD_NAMESPACE}}%" "$(composer_autoload_input)"

if [ "$INTERACTIVE" = 0 ]; then
    echo "Autoload (psr-4): $(input_data_get_value "%{{COMPOSER_AUTOLOAD_NAMESPACE}}%")"
fi
