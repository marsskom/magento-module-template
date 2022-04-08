function composer_description_get_hint() {
    local composer_description
    composer_description=$(get_hint_composer_repodesc)

    echo "$composer_description"
}

function composer_description_input() {
    local hint_string
    hint_string="$(composer_description_get_hint)"

    local composer_description

    if [ "$INTERACTIVE" = 1 ]; then
        read -rp "Composer description [$hint_string]: " composer_description
    fi

    composer_description=${composer_description:-$hint_string}

    echo "$composer_description"
}

input_data_add "%{{COMPOSER_DESCRIPTION}}%" "$(composer_description_input)"

if [ "$INTERACTIVE" = 0 ]; then
    echo "Composer description: $(input_data_get_value "%{{COMPOSER_DESCRIPTION}}%")"
fi
