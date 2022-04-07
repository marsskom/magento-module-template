declare git_author_name
git_author_name=$(git config --get user.name)
read -rp "Enter your name [$git_author_name]: " AUTHOR_NAME
AUTHOR_NAME=${AUTHOR_NAME:-$git_author_name}
input_data_add "%{{AUTHOR_NAME}}%" "$AUTHOR_NAME"
