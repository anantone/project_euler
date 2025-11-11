class EvenlyDivisibleByRange:

    def __init__(self, min_range, max_range):
        self.range = range(min_range, max_range + 1)

    def find_smallest(self):
        candidate = 1
        while not self.evenly_divisible(candidate):
            candidate += 1
        return candidate

    def evenly_divisible(self, candidate):
        for i in self.range:
            if candidate % i != 0:
                return False
        return True

if __name__ == "__main__":
    a = EvenlyDivisibleByRange(1, 20)
    print(a.find_smallest())

