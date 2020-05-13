#!/usr/bin/env python3
# -*- coding: utf-8 -*-
# m43

import sys


def getQs(string):
    numbers = sorted([float(x) for x in string.split()])
    qs = []
    for q in range(10, 100, 10):
        # TODO well, it's one of these, but which one?
        value = str(numbers[((len(numbers) - 1) * q) // 100])
        # value = str(numbers[((len(numbers)) * q) // 100 - 1])
        # value = str(numbers[((len(numbers)) * q) // 100])
        qs.append(value)
    return qs


if __name__ == '__main__':
    if len(sys.argv) != 2:
        print("Invalid number of arguments given! Got {} arguments instead of 2. These are the arguments: {}".format(
            len(sys.argv), sys.argv))
        exit(1)

    try:
        with open(sys.argv[1]) as file:
            hyp_lines = file.readlines()

        print("Hyp#" + "#".join(["Q" + str(x) for x in range(10, 100, 10)]))
        hyp_index = 1
        for hypothesis in hyp_lines:
            if not hypothesis.strip():
                continue

            print("{:03d}#{}".format(hyp_index, "#".join(getQs(hypothesis))))
            hyp_index += 1
        print()

    except Exception as e:
        print("Whoops! Consider this:", str(e))
