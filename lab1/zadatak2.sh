#!/usr/bin/env bash
# -*- coding: utf-8 -*-
# m43

grep  -iE "jabuka|dinja|jagoda|lubenica|banana" namirnice.txt
echo

grep -ivE "jabuka|dinja|jagoda|lubenica|banana" namirnice.txt > ne-voce.txt
cat ne-voce.txt
echo

grep -IrEn "\b[A-Z]{3}[0-9]{6}\b" ~/projekti* # Cut can be used if only the line number is necessary, like | cut -d: -f2
echo

find . -mtime +6 -mtime -15 -ls  # Everything is a file, no "-type f" needed...
echo

for i in {1..15} ; do
    echo ${i}
done
echo