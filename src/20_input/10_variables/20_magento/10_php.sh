declare sys_php_version
sys_php_version=$(php -r 'echo PHP_VERSION;')
read -rp "PHP version [$sys_php_version]: " PHP_VERSION
PHP_VERSION=${PHP_VERSION:-$sys_php_version}
input_data_add "%{{PHP_VERSION}}%" "$PHP_VERSION"
