import std.stdio;
import std.array;
void main(string[] args) {
    auto count = 0;
    foreach (line; stdin.byLine()) {
        auto vals =  split(line, '\t');
        count += vals.length;
    }
    writeln(count);
}