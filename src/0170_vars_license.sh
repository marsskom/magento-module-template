declare license
license="osl-3.0"

read -rp "Choose license [$license]: " LICENSE_SET
LICENSE_SET=${LICENSE_SET:-$license}
input_data_add "%{{LICENSE_SET}}%" "$LICENSE_SET"

input_data_add "%{{LICENSE_CODE}}%" "$(license_get_code "$(license_load "$LICENSE_SET")")"
