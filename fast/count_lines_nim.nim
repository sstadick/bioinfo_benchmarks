import strutils, sequtils

proc main() =
  var count = 0
  for line in stdin.lines:
    for val in line.split('\t'):
      if "bc" in toLower(val[1..<4]):
        inc(count)
  echo count

main()
