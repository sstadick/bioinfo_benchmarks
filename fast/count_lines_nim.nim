import strutils, sequtils

proc main() =
  var count = 0
  var line = ""
  while stdin.readLine(line):
    for val in line.toLowerAscii().split('\t'):
      if val[1..3].contains("bc"):
        inc(count)
  echo count

main()
