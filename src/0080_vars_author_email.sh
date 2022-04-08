declare git_author_email
git_author_email=$(git config --get user.email)
read -rp "Enter your email [$git_author_email]: " AUTHOR_EMAIL
AUTHOR_EMAIL=${AUTHOR_EMAIL:-$git_author_email}
input_data_add "%{{AUTHOR_EMAIL}}%" "$AUTHOR_EMAIL"
