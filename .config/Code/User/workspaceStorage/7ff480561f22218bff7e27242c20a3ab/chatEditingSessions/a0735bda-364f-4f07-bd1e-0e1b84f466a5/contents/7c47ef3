#!/bin/bash
# Format all XML files in the tutorials directory

echo "Formatting XML files in tutorials directory..."

find ./tutorials -name "*.xml" -type f | while read -r file; do
    echo "Formatting: $file"
    xmllint --format "$file" --output "$file"
done

echo "Done!"