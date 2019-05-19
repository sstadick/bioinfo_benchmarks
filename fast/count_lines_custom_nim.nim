import strutils, parseutils

# proc toLowerInPlace(line: var string) =
#     for i in 0..line.high:
#         line[i] = line[i].toLowerAscii()

iterator splitter(line: string, val: var string, token = '\t'): string =
    val.setLen(0)
    for c in line:
        if c != token:
            val.add(c.toLowerAscii())
        else:
            yield val
            val.setLen(0)

proc main() =
    var
        count = 0
        line = ""
        valBuf = ""
        table {.noinit.}: SkipTable

    initSkipTable(table, "bc")
    while stdin.readLine(line):
        # toLowerInPlace(line)
        for val in line.splitter(valBuf, '\t'):
            if find(table, val[1..3], "bc") >= 0:
                inc(count)
    echo count

main()
