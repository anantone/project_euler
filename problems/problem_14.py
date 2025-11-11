def main():
    max_steps = 0
    number = 0
    for candidate in range(1, 1_000_000):
        if steps(candidate) > max_steps:
            max_steps = steps(candidate)
            number = candidate
    print("The answer is", number, "with", max_steps, "steps.")

def steps(number, count = 0):
    if number <= 0:
        raise ValueError("Only positive integers are allowed")
    if number == 1:
        return count
    else:
        if number % 2 == 0:
            count += 1
            return steps(number / 2, count)
        else:
            count += 1
            return steps(number * 3 + 1, count)

if __name__ == "__main__":
    main()
