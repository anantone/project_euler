def main():
    total = 0
    num = int(input("Enter a number: "))
    for i in range(2, num):
        if is_prime(i):
            total += i
    print(f"The sum of prime numbers lower than {num} is {total}.")

def is_prime(num):
    for n in range(2, int(num ** 0.5) + 1):
        if num % n == 0:
            return False
    return True

if __name__ == '__main__':
    main()
