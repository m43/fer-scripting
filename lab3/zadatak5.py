#!/usr/bin/env python3
# -*- coding: utf-8 -*-
# m43

import sys


def print_usage():
    """
    Help function to print script usage instructions.
    """
    print("To call the script properly, run './zadatak2.py input_file_with_masters_records'. "
          "The script needs to be UTF-8 encoded")


if __name__ == '__main__':
    if len(sys.argv) != 2:
        print("Invalid number of arguments given! Got {} arguments instead of 2. These are the arguments: {}".format(
            len(sys.argv), sys.argv))
        print_usage()
        exit(1)

    try:
        with open(sys.argv[1], encoding="utf8") as file:
            masters = [(s[0].split(","), s[1], s[2]) for s in
                       [student.strip().split(";") for student in file.readlines() if len(student.strip()) != 0]]

        print("<UL>")
        print("\n".join(
            ["\t<LI>  {} {}, <I>{}</I>, {} </LI>".format(s[0][1].strip(), s[0][0].strip(), s[1].strip(), s[2].strip())
             for s in masters]))
        print("</UL>")

    except Exception as e:
        print("Invalid input file! Consider this:", str(e))
        print_usage()
