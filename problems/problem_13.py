FILENAME = 'problem_13.txt'

with open(FILENAME) as file:
    numbers = [int(line.rstrip()) for line in file]
    print(str(sum(numbers))[0:10])
