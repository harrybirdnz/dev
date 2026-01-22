#!/bin/bash
# Format all XML files in the tutorials directory with 4-space indentation

echo "Formatting XML files in tutorials directory..."

# Set indentation to 4 spaces
export XMLLINT_INDENT="    "

find ./tutorials -name "*.xml" -type f | while read -r file; do
    echo "Formatting: $file"
    xmllint --format "$file" --output "$file"
done

echo "Done!"