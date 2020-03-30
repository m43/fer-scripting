#!/usr/bin/env bash
# -*- coding: utf-8 -*-
# m43

proba="Ovo je proba"
echo $proba
echo  # Just for some space

lista_datoteka=(*)  # Folders are files.
printf "%s\n" "${lista_datoteka[@]}"
# for item in "${lista_datoteka[@]:1:3}"; do
#     echo "-->" "$item" \<--
# done
echo

#proba3=${proba}". "$proba". "$proba"."
proba3=$(for i in {1..2}; do echo $proba". "; done)${proba}\.
echo $proba3
echo

a=4
b=3
c=7
d=$(($(($a+4))*$b%$c))
echo $d
echo

broj_rijeci=`cat *.txt | wc -c`
echo $broj_rijeci
echo

ls -hail ~
echo

cat /etc/passwd | cut -d: -f1,6-7
echo

ps aux | cut  -d"\t" -f1,2,11
echo
