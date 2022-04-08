function license_set_get_hint() {
    local license_set
    license_set=$(get_hint_license)

    if [ -z "$license_set" ]; then
        license_set="osl-3.0"
    fi

    echo "$license_set"
}

function license_set_input() {
    local hint_string
    hint_string="$(license_set_get_hint)"

    local license_set

    if [ "$INTERACTIVE" = 1 ]; then
        read -rp "Choose license [$hint_string]: " license_set
    fi

    license_set=${license_set:-$hint_string}

    echo "$license_set"
}

declare LICENSE_SET
LICENSE_SET="$(license_set_input)"

input_data_add "%{{LICENSE_SET}}%" "$LICENSE_SET"
input_data_add "%{{LICENSE_CODE}}%" "$(license_get_code "$(license_load "$LICENSE_SET")")"

if [ "$INTERACTIVE" = 0 ]; then
    echo "License: $(input_data_get_value "%{{LICENSE_SET}}%")"
fi
