declare git_repo_name
git_repo_name="$(input_data_get_value "%{{M2_VENDOR}}%")/$(input_data_get_value "%{{M2_VENDOR_MODULE}}%")"
git_repo_name="${git_repo_name,,}"

read -rp "Composer repo name [$git_repo_name]: " GIT_REPO_NAME
GIT_REPO_NAME=${GIT_REPO_NAME:-$git_repo_name}
input_data_add "%{{GIT_REPO_NAME}}%" "$GIT_REPO_NAME"
