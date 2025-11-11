import math

def main():
    numbers = generate_triangular_numbers()
    candidate = next(numbers)
    while len(divisors(candidate)) <= 500:
        candidate = next(numbers)
    print(candidate)

def generate_triangular_numbers():
    i = 0
    n = 1
    while True:
        i += n
        yield i
        n += 1

def divisors(number):
    divisors = []
    for i in range(1,int(math.sqrt(number)) + 1):
        if number % i == 0:
            divisors.append(i)
            if i != number// i:
                divisors.append(number // i)
    return divisors

if __name__ == "__main__":
    main()
