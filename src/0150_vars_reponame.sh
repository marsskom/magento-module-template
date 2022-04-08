function composer_reponame_get_hint() {
    local composer_reponame
    composer_reponame=$(get_hint_composer_reponame)

    if [ -z "$composer_reponame" ]; then
        composer_reponame="$(input_data_get_value "%{{M2_VENDOR}}%")/$(input_data_get_value "%{{M2_VENDOR_MODULE}}%")"
        composer_reponame="${composer_reponame,,}"
    fi

    echo "$composer_reponame"
}

function composer_reponame_input() {
    local hint_string
    hint_string="$(composer_reponame_get_hint)"

    local composer_reponame

    if [ "$INTERACTIVE" = 1 ]; then
        read -rp "Composer repo name [$hint_string]: " composer_reponame
    fi

    composer_reponame=${composer_reponame:-$hint_string}

    echo "$composer_reponame"
}

input_data_add "%{{GIT_REPO_NAME}}%" "$(composer_reponame_input)"

if [ "$INTERACTIVE" = 0 ]; then
    echo "Composer repo name: $(input_data_get_value "%{{GIT_REPO_NAME}}%")"
fi
