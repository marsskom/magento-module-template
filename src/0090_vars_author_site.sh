function author_homepage_get_hint() {
    local author_homepage
    author_homepage=$(get_hint_author_homepage)

    echo "$author_homepage"
}

function author_homepage_input() {
    local hint_string
    hint_string="$(author_homepage_get_hint)"

    local author_homepage

    if [ "$INTERACTIVE" = 1 ]; then
        read -rp "Link to your site [$hint_string]: " author_homepage
    fi

    author_homepage=${author_homepage:-$hint_string}

    echo "$author_homepage"
}

input_data_add "%{{AUTHOR_HOMEPAGE}}%" "$(author_homepage_input)"

if [ "$INTERACTIVE" = 0 ]; then
    echo "Homepage: $(input_data_get_value "%{{AUTHOR_HOMEPAGE}}%")"
fi
