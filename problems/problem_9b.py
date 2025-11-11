#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Fri Oct 10 21:47:26 2025

@author: anantone
"""

def main():
    for i in range(1, 1001):
        for j in range(1, 1001):
            for k in range(1, 1001):
                if is_triangle(i, j, k):
                    if is_right_triangle(i, j, k):
                        if specific_sum(i, j, k, 1000):
                            return i * j * k
                        
def is_triangle(i, j, k):
    i < j and j < k
    
def is_right_triangle(i, j, k):
    i ** 2 + j ** 2 == k ** 2
    
def specific_sum(i, j, k, total):
    i + j + k == total

if __name__ == "__main__":
    print(main())
