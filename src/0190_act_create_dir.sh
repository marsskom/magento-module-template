if [ -d "$(actions_get_dest_dir)" ]; then
    echo "Directory '$(actions_get_dest_dir)' already exists!"
    exit 1
fi

mkdir -p "$(actions_get_dest_dir)"
