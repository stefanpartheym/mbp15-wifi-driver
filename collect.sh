#!/bin/bash
#
# Collect MacOS wifi driver files.
# This script must be executed in MacOS.
#

function step {
    echo -e "\n# $1:"
}

function result {
    if [ $? -eq 0 ]; then
        echo "  => SUCCESS"
    else
        echo "  => FAILED"
        exit 1
    fi
}

# ---

version="4364"
name="C-$version"
source_path="/usr/share/firmware/wifi"
dest_raw="./driver-files"
j="json"

# ---

step "Checking system"
test `uname` == 'Darwin' || (echo "Script must be executed on MacOS!" && false)
result

step "Determining requested files via ioreg"
requested_files=`ioreg -l | grep "$name" | grep 'RequestedFiles'`
result

step "Parsing ioreg output"
json_data=`echo "$requested_files" | sed 's/.*(\\(.*\\))/\\1/' | sed 's/=/:/g'` &&\
echo "$json_data" | $j
result

step "Creating destination directory for raw files"
mkdir -p "$dest_raw"
result

keys=`echo "$json_data" | $j -k | $j -A -c 'console.log(this.join(" "))'`
for key in $keys; do
    source_filepath=`echo "$json_data" | $j $key`
    source_filepath="${source_path}/${source_filepath}"
    source_filename=`basename $source_filepath`

    step "Collecting file '$source_filename'"
    cp "$source_filepath" "$dest_raw"
done
