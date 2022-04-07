function licence_cache_get_file_name() {
    echo "$SCRIPT_PATH/cache/$1.json"
}

function licence_cache_write() {
    echo "$2" >"$(licence_cache_get_file_name "$1")"
}

function licence_cache_read() {
    cat "$(licence_cache_get_file_name "$1")"
}

function license_load() {
    if [[ ! -e "$(licence_cache_get_file_name "$1")" ]]; then
        licence_cache_write "$1" "$(curl -s "https://api.github.com/licenses/$1")"
    fi

    echo "$(licence_cache_get_file_name "$1")"
}

function license_get_code() {
    "$SCRIPT_PATH/jq.sh" '.spdx_id' "$1"
}

function license_get_text() {
    "$SCRIPT_PATH/jq.sh" '.body' "$1"
}
