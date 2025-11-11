class Squares:

    def __init__(self, number):
        self.square_of_sum = (number * (number + 1)/2)**2
        self.sum_of_squares = number * (number + 1) * (2 * number + 1)/6
        self.difference = int(self.square_of_sum - self.sum_of_squares)

print(Squares(100).difference)

