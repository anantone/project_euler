"""
Find the largest palindrome made from the product of two 3-digit numbers.
"""

import itertools

def main():
    print(largest(100, 999))

def all_products(min_factor, max_factor):
    return [pair[0]*pair[1] for pair in itertools.combinations(list(range(min_factor, max_factor)), 2)]

def is_palindrome(number):
    return str(number) == str(number)[::-1]

def all_palindromes(min_factor, max_factor):
    return [product for product in all_products(min_factor, max_factor) if
            is_palindrome(product)]

def largest(min_factor, max_factor):
    return max(all_palindromes(min_factor, max_factor))

if __name__ == "__main__":
    main()
