import std.stdio;
import std.array;
import std.uni;
import std.algorithm;

class Record {
    char[] name;
    ulong count;

    this(char[] name, ulong count) {
        this.name = name;
        this.count = count;
    }
}

Record create_record(char[][] vals) {
    auto count = filter!(x => canFind(toLower(x)[1..4], "bc"))(vals).array().length;
    auto record = new Record(vals[0], count);
    return record;
}

void main(string[] args) {
    Record[] records;
    // stdin.byLine.map!(l => create_record(split(l, '\t'))).map!(x => x.count).sum.writeln;
    foreach (line; stdin.byLine()) {
        records ~= create_record(splitter(line, '\t'));
    }
    writeln(sum(map!(x => x.count)(records)));
}