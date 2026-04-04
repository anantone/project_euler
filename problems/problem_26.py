"""
Find the value of d < 1000 for which 1/d contains the longest recurring cycle.

The length of the recurring cycle of 1/d can be found using the concept of 
multiplicative order. For a fraction 1/d where d is coprime to 10:
- The cycle length is the smallest positive integer k such that 10^k ≡ 1 (mod d)
- This is called the multiplicative order of 10 modulo d

For d with factors of 2 or 5, we first remove those factors since they only
affect the non-repeating part of the decimal.
"""

def get_cycle_length(d):
    """
    Find the length of the recurring cycle in the decimal representation of 1/d.
    Uses the multiplicative order of 10 modulo d (after removing factors of 2 and 5).
    """
    # Remove factors of 2 and 5 (they don't contribute to the cycle)
    while d % 2 == 0:
        d //= 2
    while d % 5 == 0:
        d //= 5
    
    # If d is now 1, there's no recurring cycle
    if d == 1:
        return 0
    
    # Find the multiplicative order of 10 modulo d
    # i.e., the smallest k such that 10^k ≡ 1 (mod d)
    remainder = 1
    cycle_length = 0
    
    for k in range(1, d + 1):
        remainder = (remainder * 10) % d
        if remainder == 1:
            cycle_length = k
            break
    
    return cycle_length


def find_longest_cycle(limit):
    """Find d < limit with the longest recurring cycle in 1/d."""
    max_cycle = 0
    best_d = 0
    
    for d in range(2, limit):
        cycle = get_cycle_length(d)
        if cycle > max_cycle:
            max_cycle = cycle
            best_d = d
    
    return best_d, max_cycle


if __name__ == "__main__":
    # Find the answer for d < 1000
    d, cycle_length = find_longest_cycle(1000)
    
    print(f"The value of d < 1000 with the longest recurring cycle is: {d}")
    print(f"The recurring cycle length is: {cycle_length}")
    
    # Let's also verify with some known examples
    print("\nVerification with known examples:")
    for test_d in [2, 3, 6, 7, 9, 10]:
        print(f"1/{test_d} has a cycle length of {get_cycle_length(test_d)}")