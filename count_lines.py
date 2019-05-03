import sys

class Record(object):
    __slots__ = ["name", "count"]
    def __init__(self, name, count):
        self.name = name
        self.count = count

def create_record(vals):
    count = len([val for val in vals if "bc" in val[1:4].lower()])
    record = Record(vals[0], count)
    # record = {"name": vals[0], "count": count}
    return record

def main():
    records = []
    for line in sys.stdin:
        records.append(create_record(line.split('\t')))

    print(sum([r.count for r in records]))

if __name__ == '__main__':
    main()