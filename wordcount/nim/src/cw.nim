# This is just an example to get you started. A typical binary package
# uses this file as the main entry point of the application.
import os
from strutils import isAlphaNumeric
from strformat import fmt

proc wordCount(file: File): (int, int, int) {.inline.} =
  const bufferSize = 1024 * 4
  var buffer: array[bufferSize, uint8]
  var totalLines = 0
  # var totalChars = 0
  var totalWords = 0
  var totalBytes = 0
  var files = newSeq[File]()
  var inWord = true
  while true:
    let bytesRead = file.readBytes(buffer, 0, bufferSize)
    if bytesRead == 0:
      break
    totalBytes.inc(bytesRead)
    for i in 0 ..< bytesRead:
      let c = buffer[i]
      if c >= 33'u8 and c <= 126'u8:
        # inc(totalChars)
        inWord = true
      if c == 10'u8:
        inc(totalLines)
      if c <= 32'u8:
        if inWord:
          inWord = false
          inc(totalWords)
  return (totalLines, totalWords, totalBytes)

proc main() =
  var
    totalWords = 0
    totalBytes = 0
    totalLines = 0

  if paramCount() > 1:
    for i in 1 .. paramCount():
      var
        fileName = paramStr(i)
        fh = open(fileName)
        tw = 0
        tb = 0
        tl = 0
      (tl, tw, tb) = wordCount(fh)
      totalLines.inc(tl)
      totalBytes.inc(tb)
      totalWords.inc(tw)
      close(fh)
      echo fmt("{tl} {tw} {tb} {fileName}")
  else:
    (totalLines, totalWords, totalBytes) = wordCount(stdin)
  echo fmt("{totalLines} {totalWords} {totalBytes}")

when isMainModule:
  main()

