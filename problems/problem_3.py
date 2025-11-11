class Factors:

    def __init__(self, number):
        self.factors = []
        divisor = 2
        while number > 1:
            while number % divisor == 0:
                self.factors.append(divisor)
                number /= divisor
            divisor += 1

    def factors(self):
        return self.factors



if __name__ == "__main__":
    print(Factors(600851475143).factors)
