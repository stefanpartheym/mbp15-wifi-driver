#!/bin/bash
#
# Installs collected MacOS wifi driver files from "target" directory.
# This script must be executed in Linux.
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
source_path="./driver-files"
dest_path="/lib/firmware/brcm"

# ---

IFS=$'\n'
for source_filename in `ls -1 $source_path`; do
    case "${source_filename##*.}" in
        "trx") target_filename="brcmfmac${version}-pcie.bin" ;;
        "clmb") target_filename="brcmfmac${version}-pcie.clm_blob" ;;
        "txt") target_filename="brcmfmac${version}-pcie.Apple Inc.-MacBookPro15,2.txt" ;;
        *) target_filename="" ;;
    esac

    if [ -n "$target_filename" ]; then
        step "Copying file '$source_filename' to '${dest_path}/${target_filename}'"
        cp "${source_path}/${source_filename}" "${dest_path}/${target_filename}"
        result
    fi
done
