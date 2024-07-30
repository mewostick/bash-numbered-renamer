#!/bin/bash
read -p "Enter the path to the directory: " directory

if [ ! -d "$directory" ]; then
    echo "The specified directory doesn't exist."
    exit 1
fi

cd "$directory" || exit
count=1

# loop
for file in *; do
    if [ -f "$file" ]; then
        extension="${file##*.}"
        mv "$file" "$count.$extension"
        ((count++))
    fi
done

echo "Files renamed successfully."

