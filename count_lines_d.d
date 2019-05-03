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

Record create_record(R)(R vals) {
    /**
     * auto count = filter!(x => canFind(toLower(x)[1..4], "bc"))(vals).array().length;
     * optimized:
     * - removing array() call, which allocates a copy of the data
     * - replacing filter() with a single call to count()
     * - only performing toLower() on the part of the string we care about
     */
    const count = vals.count!(x => canFind(toLower(x[1..4]), "bc"));

    auto record = new Record(vals.front, count);
    return record;
}

void main(string[] args) {
    Record[] records;
    // stdin.byLine.map!(l => create_record(split(l, '\t'))).map!(x => x.count).sum.writeln;
    foreach (line; stdin.byLine()) {
    	  // splitter is a lazy range of `line` split by `\t`
        records ~= create_record(splitter(line, '\t'));
    }
    writeln(sum(map!(x => x.count)(records)));
}