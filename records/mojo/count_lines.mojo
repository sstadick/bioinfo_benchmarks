from ExtraMojo.fs.file import FileReader
from ExtraMojo.bstr.bstr import SplitIterator, find, to_ascii_lowercase
from memory import Span

alias TAB = ord("\t")


@value
struct Record:
    var name: String
    var count: Int


fn create_record(line: Span[UInt8]) raises -> Record:
    var name = String()
    var iter = SplitIterator(line, TAB)
    name.write_bytes(iter.peek().value())

    var count = 0
    for value in SplitIterator(line, TAB):
        if find(value[1:4], "bc".as_bytes()):
            count += 1

    return Record(name, count)


fn main() raises:
    var fh = open("/dev/stdin", "r")
    var reader = FileReader(fh^)

    var buffer = List[UInt8]()
    var records = List[Record]()
    while reader.read_until(buffer) != 0:
        to_ascii_lowercase(buffer)
        records.append(create_record(buffer))

    var count = 0
    for record in records:
        count += record[].count
    print(count)
