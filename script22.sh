#!/bin/bash

# Ensure destination folders exist
mkdir -p phread33 phread64

# Function to get minimum ASCII from quality lines
get_min_ascii() {
    local file="$1"
    local min=127

    while IFS= read -r line; do
        for (( i=0; i<${#line}; i++ )); do
            ascii=$(printf "%d" "'${line:$i:1}")
            (( ascii < min )) && min=$ascii
        done
    done < <(awk 'NR % 4 == 0' "$file")

    echo "$min"
}

# Loop through each FASTQ file
for file in *.fastq; do
    min_ascii=$(get_min_ascii "$file")

    if (( min_ascii < 64 )); then
        echo "$file → Phred+33 → moving to phread33/"
        mv "$file" phread33/
    else
        echo "$file → Phred+64 → moving to phread64/"
        mv "$file" phread64/
    fi
done

