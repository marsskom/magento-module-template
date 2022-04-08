function m_vendor_name_get_hint() {
    local vendor_name
    vendor_name=$(get_hint_vendor_name)

    echo "$vendor_name"
}

function m_vendor_name_input() {
    local hint_string
    hint_string="$(m_vendor_name_get_hint)"

    local vendor_name

    if [ "$INTERACTIVE" = 1 ]; then
        read -rp "Magento 2 Vendor Name [$hint_string]: " vendor_name
    fi

    vendor_name=${vendor_name:-$hint_string}

    echo "$vendor_name"
}

input_data_add "%{{M2_VENDOR}}%" "$(m_vendor_name_input)"

if [ "$INTERACTIVE" = 0 ]; then
    echo "Magento 2 Vendor Name: $(input_data_get_value "%{{M2_VENDOR}}%")"
fi
