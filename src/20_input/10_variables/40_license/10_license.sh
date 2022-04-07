declare license
license="osl-3.0"

read -rp "Choose license [$license]: " LICENSE_CODE
LICENSE_CODE=${LICENSE_CODE:-$license}
input_data_add "%{{LICENSE_CODE}}%" "$LICENSE_CODE"
