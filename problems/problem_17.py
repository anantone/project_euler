def main(maximum):
    total_letters = 0
    for number in range(1, maximum + 1):
        total_letters += length_in_letters(number)
    print(total_letters)

DIGITS = {1: "one", 2: "two", 3: "three", 4: "four", 5: "five", 6: "six", 7:
          "seven", 8: "eight", 9: "nine"}
TEENS = {10: "ten", 11: "eleven", 12: "twelve", 13: "thirteen", 14: "fourteen",
         15: "fifteen", 16: "sixteen", 17: "seventeen", 18: "eighteen", 19:
         "nineteen"}

DECADES = {20: "twenty", 30: "thirty", 40: "forty", 50: "fifty", 60: "sixty",
           70: "seventy", 80: "eighty", 90: "ninety"}

def length_in_letters(integer):
    if integer == 0:
        return 0
    elif integer < 10:
        return len(DIGITS[integer])
    elif integer < 20:
        return len(TEENS[integer])
    elif integer < 100:
        return len(DECADES[integer-(integer%10)]) + length_in_letters(integer%10)
    elif integer < 1000:
        if integer % 100 == 0:
            return len(DIGITS[integer//100]) + len('hundred')
        else:
            return len(DIGITS[integer//100]) + len('hundred') + len('and') + length_in_letters(integer-(integer//100)*100)
    elif integer == 1000:
        return len('one') + len('thousand')


if __name__ == "__main__":
    main(1000)
