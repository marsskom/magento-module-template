function actions_get_dest_dir() {
    local vendor
    vendor=$(input_data_get_value "%{{M2_VENDOR}}%")

    local vendor_module_name
        vendor_module_name=$(input_data_get_value "%{{M2_VENDOR_MODULE}}%")

    echo "$DIR_DESTINATION/$vendor/$vendor_module_name"
}
