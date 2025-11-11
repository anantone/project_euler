class FactorialDigitSum:

    def __init__(self, number):
        self.number = number

    def factorial(self):
        factorial = 1
        for x in range(1, self.number + 1):
            factorial *= x
        return factorial

    def digit_sum(self):
        digit_sum = 0
        for digit in list(str(self.factorial())):
            digit_sum += int(digit)
        return digit_sum

print(FactorialDigitSum(100).digit_sum())
