#!/bin/bash

# Define a function to display files with 'bat' and apply various commands
function bat_integration() {
    local file="$1"

    # Check if the file exists
    if [[ ! -e "$file" ]]; then
        echo "File '$file' does not exist."
        return 1
    fi

    # Display the file content using 'bat'
    bat --style=plain --paging=always "$file"

    # Perform other operations on the file content
    echo "=== Performing additional operations ==="

    # Example: Count the number of lines in the file
    line_count=$(cat "$file" | wc -l)
    echo "Line count: $line_count"

    # Example: Search for a specific pattern using 'grep'
    pattern="example"
    grep_result=$(cat "$file" | grep "$pattern")
    echo "Lines containing '$pattern':"
    echo "$grep_result"

    # Example: Replace a string using 'sed'
    replacement="new_example"
    sed -i "s/$pattern/$replacement/g" "$file"
    echo "Replaced '$pattern' with '$replacement' in the file."
}

# Check if a filename is provided as an argument
if [[ $# -ne 1 ]]; then
    echo "Usage: $0 <filename>"
    exit 1
fi

# Call the 'bat_integration' function with the provided filename
filename="$1"
bat_integration "$filename"
