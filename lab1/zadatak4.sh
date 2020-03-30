#!/usr/bin/env bash
# -*- coding: utf-8 -*-
# m43


if [[ "$#" -ne 2 ]]; then
    echo "Incorrect number of arguments."
    echo "Usage: current_images_folder destination_folder"
    exit 1
fi

if [[ ! -d "${1}" ]]; then
    echo "The directory does not exist: ${1}"
    exit 1
fi

if [[ ! -d "${2}" ]]; then
    echo "The directory does not exist: ${2}"
    exit 1
fi

image_count=0
for image in "${1}"/*.jpg ; do
    image_count=$((image_count+1))
    image_name=`basename "${image}"`
    subfolder=`stat "${image}" | grep Modify | sed -En "s#.*([0-9]{4})-([0-9]{2})-([0-9]{2}).*#\1-\2#p"`
    mkdir -p "${2}/${subfolder}"
    mv "${image}" "${2}"/"${subfolder}"/"${image_name}"
done

echo "Moved ${image_count} images from ${1} to subfolders of ${1}. Have a great day!"
#evo
#zore