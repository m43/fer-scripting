#!/usr/bin/env bash
# -*- coding: utf-8 -*-
# m43


if [[ "$#" -ne 2 ]]; then
    echo "Incorrect number of arguments."
    echo "Usage: path pattern"
    exit 1
fi

if [[ ! -d "${1}" ]]; then
    echo "The directory does not exist: ${1}"
    exit 1
fi

echo "Given path-->$1<--"
echo "Given pattern-->$2<--"

### The long way, but wc gives more statistics, its better
#line_count=0
#for file in `find ${1} -type f -iname "${2}"`; do
#    line_count=$((${line_count}+`echo 30`))
#    line_count=$((${line_count}+`wc -l ${file}`))
#done
#
#echo "Total number of lines: ${line_count}"

### Cannot handle spaces in path
#match=`find ${1} -type f -iname "${2}" -print0`
#if [[ ! ${match} ]] ; then
#    echo "None files found..."
#    exit 1
#fi
#wc -l ${match}

# The best:
find ${1} -type f -iname "${2}" -print0 | wc -l --files0-from=-
