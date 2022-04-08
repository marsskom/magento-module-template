function get_hint_by_key() {
    if [ ! -e "$INPUT_FILE" ]; then
        echo ''
        return 1
    fi

    local value
    value="$(gawk -F= '/^'$1'/ {gsub(/^'$1'(\s*)=(\s*)/, "", $2); print $2}' "$INPUT_FILE")"

    echo "$value" | xargs
}

function get_hint_author_name() {
    echo "$(get_hint_by_key "name")"
}

function get_hint_author_email() {
    echo "$(get_hint_by_key "email")"
}

function get_hint_author_homepage() {
    echo "$(get_hint_by_key "homepage")"
}

function get_hint_author_role() {
    echo "$(get_hint_by_key "role")"
}

function get_hint_php_version() {
    echo "$(get_hint_by_key "version")"
}

function get_hint_vendor_name() {
    echo "$(get_hint_by_key "vendor_name")"
}

function get_hint_module_name() {
    echo "$(get_hint_by_key "module_name")"
}

function get_hint_composer_autoload() {
    echo "$(get_hint_by_key "autoload")"
}

function get_hint_composer_reponame() {
    echo "$(get_hint_by_key "repo_name")"
}

function get_hint_composer_repodesc() {
    echo "$(get_hint_by_key "repo_description")"
}

function get_hint_license() {
    echo "$(get_hint_by_key "license")"
}

function get_hint_codeowner() {
    echo "$(get_hint_by_key "code_owner")"
}
