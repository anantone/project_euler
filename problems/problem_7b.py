class NthPrime:

    def __init__(self, number):
        if number == 0:
            raise ValueError("there is no zeroth prime")
        else:
            self.number = number

    def value(self):
        primes = []
        i = 1
        while len(primes) < self.number:
            if self.is_prime(i):
                primes.append(i)
            i += 1
        return primes[-1]

    def is_prime(self, num):
        if num <= 1:
            return False
        for i in range(2, int(num**0.5) + 1):
            if num % i == 0:
                return False
        return True

print(NthPrime(10001).value())
