declare license
license="osl-3.0"

read -rp "Choose license [$license]: " LICENSE_SET
LICENSE_SET=${LICENSE_SET:-$license}
input_data_add "%{{LICENSE_SET}}%" "$LICENSE_SET"

declare license_file
license_file=$(license_load "$LICENSE_SET")

input_data_add "%{{LICENSE_CODE}}%" "$(license_get_code "$license_file")"
input_data_add "%{{LICENSE_TEXT}}%" "$(license_get_text "$license_file")"
