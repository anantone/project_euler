import numpy as np

def main():
    numbers = grid_to_arrays('grid_pb_11.txt')
    products = lines(numbers) + columns(numbers) + diagonals(numbers)
    print(max(products))

def lines(arrays):
    products = []
    for array in arrays:
        for i in range(len(array)-3):
            products.append(array[i] * array[i+1] * array[i+2] * array[i+3])
    return products

def columns(arrays):
    transposed_arrays = np.array(arrays).T
    return lines(transposed_arrays)

def diagonals(arrays):
    products = []
    for i in range(len(arrays)-3):
        for j in range(len(arrays)-3):
            products.append(arrays[i][j] * arrays[i+1][j+1] * arrays[j+2][i+2] * arrays[i+3][j+3])
    for i in range(len(arrays)-3):
        for j in range(len(arrays)-3):
            products.append(arrays[i][j] * arrays[i+1][j-1] * arrays[i+2][j-2] * arrays[i+3][j-3])
    return products


def grid_to_arrays(txt):
    with open(txt) as file:
        lines = [[int(num) for num in line] for line in [line.rstrip().split(' ') for line in file]]
        return lines

if __name__ == "__main__":
    main()
