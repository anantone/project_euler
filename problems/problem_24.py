import itertools

def main():
    print(lexicographic_permutations(9)[999999])

def lexicographic_permutations(up_to):
    return [x for x in itertools.permutations(range(0, up_to + 1))]

if __name__ == "__main__":
    main()
