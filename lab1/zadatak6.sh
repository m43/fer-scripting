#!/usr/bin/env bash
# -*- coding: utf-8 -*-
# m43


if [[ "$#" -lt 2 ]]; then
    echo "Incorrect number of arguments. Got ${#} arguments, at least two needed."
    echo $(for i in {1..27}; do echo "-"; done) | tr " " "-"
    echo "Usage: path pattern"
    exit 1
fi

if [[ ! -d "${!#}" ]]; then
    "The given destination \"${!#}\" folder is created."
    mkdir -p "${!#}"
fi

echo "Transferring started."
echo $(for i in {1..27}; do echo "-"; done) | tr " " "-"
transferred_files=0
for (( i = 1; i < ${#}; i++ )); do
    if [[ ! -e "${!i}" ]]; then
        echo "Skipping path that cannot be found: ${!i}"
#    elif [[ -e ${!#}/${!i} ]]; then
#        echo "File ${!i} already exists so it will not be transferred."
    elif [[ ! -r "${!i}" ]]; then
        echo "Skipping file that cannot be read: ${!i}"
    else
        cp -r "${!i}" "${!#}"
        ((++transferred_files))
        echo "Transfered: "${!i} --\> ${!#}/`basename "${!i}"`
    fi
done

echo $(for i in {1..27}; do echo "-"; done) | tr " " "-"
echo "Successfully transferred ${transferred_files}. You are safe now. Take your beauty sleep."
