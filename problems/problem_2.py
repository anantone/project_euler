class Fibonacci:

    def __init__(self, upper_limit):
        self.fibonacci = [1, 2]
        while self.fibonacci[-1] < upper_limit:
            self.fibonacci.append(self.fibonacci[-1] + self.fibonacci[-2])

    def sum(self):
        return sum(self.fibonacci)

if __name__ == "__main__":
    print(Fibonacci(400000).sum())
