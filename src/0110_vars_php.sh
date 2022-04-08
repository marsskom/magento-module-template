declare sys_php_version

if command -v php &>/dev/null; then
    sys_php_version=$(php -r "echo PHP_VERSION;")
else
    sys_php_version="unknown"
fi

read -rp "PHP version [$sys_php_version]: " PHP_VERSION
PHP_VERSION=${PHP_VERSION:-$sys_php_version}
input_data_add "%{{PHP_VERSION}}%" "$PHP_VERSION"
