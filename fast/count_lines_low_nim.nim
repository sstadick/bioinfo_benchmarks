import strutils, sequtils

proc main() =
  var count = 0
  let bufferLen = 12_000
  var buffer = newString(bufferLen)
  var colIndex = 0
  while true:
    var bytesRead = stdin.readChars(buffer, 0, bufferLen)
    if bytesRead == 0:
      break
    for idx in 0 ..< bytesRead:
      case buffer[idx]:
        of '\t':
          colIndex = 0
        of '\n':
          colIndex = 0
        else:
          inc(colIndex)
      if colIndex == 1 or colIndex == 2:
        if buffer[idx].toLowerAscii() == 'b':
          if buffer[idx+1].toLowerAscii() == 'c':
            inc(count)

  echo count

main()
