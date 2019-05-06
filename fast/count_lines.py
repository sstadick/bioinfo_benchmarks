import sys

def main():
    count = 0
    for line in sys.stdin:
        for val in line.split('\t'):
            if "bc" in val[1:4].lower():
                count += 1
    print(count)

if __name__ == '__main__':
    main()