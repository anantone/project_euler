#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Fri Oct 10 20:11:23 2025

@author: anantone
"""

def fibonacci_generator():
    fibonacci = [1, 1]
    while True:
        yield fibonacci[-1]
        fibonacci.append(fibonacci[-1] + fibonacci[-2])

def main():
    fibonacci = fibonacci_generator()
    index = 2
    candidate = next(fibonacci)
    while len(str(candidate)) < 1000:
        index += 1
        candidate = next(fibonacci)
    print(index)

if __name__ == "__main__":
    main()
