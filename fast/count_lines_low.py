import sys

def lower_byte(byte):
    if byte >= 65 and byte <= 90:
        byte += 32
    return byte

def main():
    count = 0
    colIndex = 0
    bufferFixedLen = 12000
    buffer = bytearray(bufferFixedLen)
    while True:
        bytesRead= sys.stdin.buffer.readinto1(buffer)
        if bytesRead == 0:
            break
        for i in range(bytesRead):
            if buffer[i] == 9 or buffer[i] == 10:
                colIndex = 0
            else:
                colIndex += 1
            if colIndex == 1 or colIndex == 2:
                if lower_byte(buffer[i]) == 98:
                    if lower_byte(buffer[i+1]) == 99:
                        count += 1
    print(count)


# def main():
#     count = 0
#     for line in sys.stdin:
#         for val in line.split('\t'):
#             if "bc" in val[1:4].lower():
#                 count += 1
#     print(count)

if __name__ == '__main__':
    main()