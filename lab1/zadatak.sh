#!/usr/bin/env bash
# -*- coding: utf-8 -*-
# m43

# zadatak6.sh

# Script needs to if the correct interpreter was written:
#   .sh (interpreter /bin/bash)
#   .pl (interpreter /usr/bin/perl)
#   .py (interpreter /usr/bin/python).


if [[ "$#" -ne 1 ]]; then
    echo "Incorrect number of arguments. Got ${#} arguments."
    echo $(for i in {1..30}; do echo "-"; done) | tr " " "-"
    echo "Usage: scripts_folder"
    echo "Terminating..."
    exit 1
fi

if [[ ! -d "${1}" ]]; then
    echo "Given scripts folder path does not exist:\t"${1}
    echo "Terminating..."
    exit 1
fi

for file in "${1}"/*; do
    if [[ ! -f "${file}" ]]; then
        # echo "Skipping. Not a file: $file"
        continue
    fi

    first_line=`head -n 1 "${file}"`
#    echo "${first_line}"
#    echo "${file}"

    if [[ ${first_line} !=  "#!"* ]]; then
        echo "${file} prvo pravilo NARUSENO"
    else
        if [[ ${file} == *.sh ]]  && [[ ${first_line} == \#!\/bin/bash ]]; then
            echo "${file} OK"
        elif [[ ${file} == *.py ]]  && [[ ${first_line} == \#!\/usr/bin/python ]]; then
            echo "${file} OK"
        elif [[ ${file} == *.pl ]]  && [[ ${first_line} == \#!\/usr/bin/perl ]]; then
            echo "${file} OK"
        else
            echo "${file} drugo pravilo NARUSENO"
        fi
    fi
done
