import std.stdio;
import std.array;
import std.uni;
import std.algorithm;

void main()
{
    auto count = 0;
    char[] buf;
    while (stdin.readln(buf))
    {
        toLowerInPlace(buf);
        foreach (val; splitter(buf, '\t'))
        {
            if (canFind(val[1 .. 4], "bc"))
            {
                count++;
            }
        }
    }
    writeln(count);
}
