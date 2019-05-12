import strutils, sequtils, threadpool

func countBC(chunk: seq[string]): int =
    for line in chunk:
        for val in line.split('\t'):
            if "bc" in val[1..3]:
                inc(result)


proc main() =
    let chunkSize = 10_000
    var responses = newSeq[FlowVar[int]]()
    var buffer = newSeqOfCap[string](chunkSize)
    var curr_size = 0
    while not endOfFile(stdin):
        buffer.add(stdin.readLine().toLowerAscii())
        inc(curr_size)
        if curr_size == chunkSize:
            responses.add(spawn countBC(buffer))
            curr_size = 0
            buffer = newSeqOfCap[string](chunkSize)

    var total = 0
    for resp in responses:
        total += ^resp

    echo total

when isMainModule:
    main()
