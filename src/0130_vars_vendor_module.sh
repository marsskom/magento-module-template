function m_v_module_name_get_hint() {
    local module_name
    module_name=$(get_hint_module_name)

    echo "$module_name"
}

function m_v_module_name_input() {
    local hint_string
    hint_string="$(m_v_module_name_get_hint)"

    local module_name

    if [ "$INTERACTIVE" = 1 ]; then
        read -rp "Magento 2 Module Name [$hint_string]: " module_name
    fi

    module_name=${module_name:-$hint_string}

    echo "$module_name"
}

input_data_add "%{{M2_VENDOR_MODULE}}%" "$(m_v_module_name_input)"

if [ "$INTERACTIVE" = 0 ]; then
    echo "Magento 2 Module Name: $(input_data_get_value "%{{M2_VENDOR_MODULE}}%")"
fi
