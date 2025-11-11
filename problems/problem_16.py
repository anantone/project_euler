def main():
    print(power_digit_sum(2, 1000))

def power_digit_sum(number, power):
    digits = number ** power
    return sum([int(i) for i in list(str(digits))])

if __name__ == "__main__":
    main()
