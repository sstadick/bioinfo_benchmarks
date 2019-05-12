import strutils, sequtils, threadpool

func countBC(chunk: string): int =
    for line in chunk.toLowerAscii().splitLines():
        for val in line.split('\t'):
            if val[1..3].contains("bc"):
                inc(result)


proc main() =
    let chunkSize = 20_000
    var responses = newSeq[FlowVar[int]]()
    var buffer = newString(chunksize)
    var oldBufferLen = 0
    while not endOfFile(stdin):
        let reqSize = chunksize - oldBufferLen
        let readSize = stdin.readChars(buffer, oldBufferLen,
                reqSize) + oldBufferLen
        var chunkLen = readSize

        while chunkLen >= 0 and buffer[chunkLen - 1] notin NewLines:
            chunkLen.dec

        responses.add(spawn countBC(buffer[0..<chunkLen]))
        oldBufferLen = readSize - chunkLen
        buffer[0..<oldBufferLen] = buffer[readSize - oldBufferLen..^1]

    var total = 0
    for resp in responses:
        total += ^resp

    echo total

when isMainModule:
    main()
