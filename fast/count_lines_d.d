import std.stdio;
import std.array;
import std.uni;
import std.algorithm;

void main()
{
    auto count = 0;
    foreach (line; stdin.byLine())
    {
        foreach (val; splitter(line, '\t'))
        {
            if (canFind(toLower(val[1 .. 4]), "bc"))
            {
                count++;
            }
        }
    }
    writeln(count);
}
