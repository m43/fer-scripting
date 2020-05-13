#!/usr/bin/env python3
# -*- coding: utf-8 -*-
# m43

import os
import re
import sys

if __name__ == '__main__':
    if len(sys.argv) != 2:
        print("Invalid number of arguments given. Got these arguments:", sys.argv)
        exit(1)

    folder = sys.argv[1]
    master_filename = "studenti.txt"
    lab_group_file_pattern = 'Lab(\\d+)_g(\\d+).txt'

    try:
        files = os.listdir(folder)
        records = {}
        labs = []

        if master_filename not in files:
            raise ValueError("No file found with name:", master_filename)
        with open(os.path.join(folder, master_filename)) as file:
            for line in file.readlines():
                line = line.strip()
                if not line: continue
                parts = line.split()
                if parts[0] in records:
                    raise ValueError("Found twice the same JMBAG in", master_filename)
                records[parts[0]] = [parts[1], parts[2], {}]

        for filename in files:
            matches = re.findall(lab_group_file_pattern, filename)
            if matches:
                lab, group = matches[0]
                lab = "L" + str(int(lab))
                if lab not in labs:
                    labs.append(lab)
                with open(os.path.join(folder, filename)) as file:
                    for line in file.readlines():
                        line = line.strip()
                        if not line: continue
                        jmbag, points = line.split()
                        points = float(points)
                        if lab in records[jmbag][2]:
                            raise ValueError(
                                "Student {} {} ({}) has lab points two times for lab {}! In these two groups:"
                                "{} and {}".format(records[jmbag][1], records[jmbag][0], jmbag, lab,
                                                   records[jmbag][2][lab][1], group))
                        records[jmbag][2][lab] = (points, group)

        print("{:15} {:18} ".format("JMBAG", "Prezime, Ime") + "".join(["{:>6}".format(lab) for lab in labs]))
        for jmbag, student in records.items():
            print("{:15} {:18} ".format(jmbag, student[1] + ", " + student[0])
                  + "".join(["{:>6}".format(student[2].get(lab, ("-",))[0]) for lab in labs]))

    except Exception as e:
        print("Whoops! Consider this:", str(e))
