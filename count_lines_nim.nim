import strutils

proc main() =
  var c = 0
  for line in stdin.lines:
    var vals = line.split('\t')
    c += len(vals)

  echo(c)

main()