#!/bin/bash
#
# Download MacOS wifi driver files from packages.aunali1.com.
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
prefix="${name}__s-B2"
source_url="https://packages.aunali1.com/apple/wifi-fw/18G1012"
dest_raw="./driver-files"
requested_files="maui-X3.clmb maui-X3.txcb maui.trx P-maui-X3_M-HRPN_V-u__m-7.5.txt"

# ---

step "Creating destination directory for raw files"
mkdir -p "$dest_raw"
result

for filename in $requested_files; do
    step "Downloading file '$filename'"
    curl "${source_url}/${prefix}/${filename}" -o "${dest_raw}/${filename}"
    result
done
