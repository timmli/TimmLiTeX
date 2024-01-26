#!/bin/bash

latex_file="$1"

# Use grep to find lines with \input and then use sed to extract the filename
input_files=$(grep -o '\\input{[^}]*}' "$latex_file" | sed -e 's/\\input{\([^}]*\)}/\1/')

# Add .tex extension if it doesn't exist
input_files=$(echo "$input_files" | sed 's/\(\b[^.]*\)\(\.tex\)\?\(\b\)/\1.tex/g')

# Remove line breaks
input_files=$(echo "$input_files" | tr '\n' ' ')

# Print the extracted filenames
echo "$input_files"
