declare autoload_namespace
autoload_namespace="$(input_data_get_value "%{{M2_VENDOR}}%")\\\\$(input_data_get_value "%{{M2_VENDOR_MODULE}}%")\\\\"

read -rp "Composer autoload namespace (psr-4) [$autoload_namespace]: " COMPOSER_AUTOLOAD_NAMESPACE
COMPOSER_AUTOLOAD_NAMESPACE=${COMPOSER_AUTOLOAD_NAMESPACE:-$autoload_namespace}
input_data_add "%{{COMPOSER_AUTOLOAD_NAMESPACE}}%" "$COMPOSER_AUTOLOAD_NAMESPACE"
