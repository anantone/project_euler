def main(file):
    with open(file) as file:
        list_of_names = sorted(file.read().translate(str.maketrans('', '', '"')).split(','))
    total = 0
    for name in list_of_names:
        total += (list_of_names.index(name) + 1) * alphabetical_value(name)
    print(total)

def alphabetical_value(name):
    value = 0
    for char in name:
        value += ord(char) - 64
    return value

if __name__ == "__main__":
    main('0022_names.txt')
