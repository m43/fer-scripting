#!/usr/bin/env python3
# -*- coding: utf-8 -*-
# m43

import sys


class Matrix:
    @staticmethod
    def loadMatricesFromFile(path):
        m1_lines = []
        m2_lines = []
        with open(path, encoding="utf8") as file:
            empty_line = False
            for line in file.readlines():
                line = line.strip()
                if not line:
                    empty_line = True
                else:
                    if not empty_line:
                        m1_lines.append(line)
                    else:
                        m2_lines.append(line)

        m1 = Matrix.parseMatrixFromLines(m1_lines)
        m2 = Matrix.parseMatrixFromLines(m2_lines)

        return m1, m2

    @staticmethod
    def parseMatrixFromLines(lines):
        values = dict()
        n, m = [int(x) for x in lines[0].split()]

        if n <= 0 or m <= 0:
            raise ValueError("Invalid matrix dimensions. Got {}x{}".format(n, m))

        for line in lines[1:]:
            parts = line.split()
            row, column, value = int(parts[0]), int(parts[1]), float(parts[2])

            if row > n or column > m:
                raise ValueError("Invalid index ({},{}) for matrix of this dimension {}x{}. Found at line {}".format(
                    row, column, n, m, line))

            values[row, column] = value

        return n, m, values

    @staticmethod
    def multiplyMatrices(m1, m2):
        rows1, columns1, dict1 = m1
        rows2, columns2, dict2 = m2

        if columns1 != rows2:
            raise ValueError(
                "Cannot multiply matrices with this dimensions: {}x{} {}x{}".format(rows1, columns1, rows2, columns2))

        rows3, columns3 = rows1, columns2
        dict3 = {}
        for row in range(1, rows3 + 1):
            for column in range(1, columns3 + 1):
                value = 0
                for i in range(1, columns1 + 1):
                    value += dict1.get((row, i), 0) * dict2.get((i, column), 0)
                if value:
                    dict3[row, column] = value

        return rows3, columns3, dict3

    @staticmethod
    def toString(m):
        rows, columns, dictionary = m

        lines = ["{} {}".format(rows, columns)]
        for key, value in dictionary.items():
            lines.append("{} {} {}".format(key[0], key[1], value))

        return lines

    @staticmethod
    def dumpMatrix(m, path):
        with open(path, "w") as file:
            file.writelines("\n".join(Matrix.toString(m)) + "\n")  # TODO will this \n work on windows?


if __name__ == '__main__':
    if len(sys.argv) != 3:
        print("Invalid number of arguments given! Got {} arguments instead of 3. These are the arguments: {}".format(
            len(sys.argv), sys.argv))
        exit(1)

    input_path = sys.argv[1]
    output_path = sys.argv[2]

    try:
        m1, m2 = Matrix.loadMatricesFromFile(input_path)

        m3 = Matrix.multiplyMatrices(m1, m2)

        Matrix.dumpMatrix(m3, output_path)
        for line in Matrix.toString(m3):
            print(line)

    except Exception as e:
        print("Whoops! Consider this:", str(e))
