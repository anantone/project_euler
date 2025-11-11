def main():
    for i in range(1, 1001):
        for j in range(1, 1001):
            for k in range(1, 1001):
                if i < j and j < k:
                    if i ** 2 + j ** 2 == k ** 2:
                        if i + j + k == 1000:
                            return i * j * k

if __name__ == "__main__":
    print(main())

