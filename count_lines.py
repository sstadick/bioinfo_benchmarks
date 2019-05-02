import sys

def main():
    count = 0
    for line in sys.stdin:
        vals = line.split('\t')
        count += len(vals)
    print(count)

if __name__ == '__main__':
    main()