import strutils, sequtils, math, tables

type
  Record = object
    name: string
    count: int

proc createRecord(vals: seq[string]): Record =
  var count = len(vals.filterIt("bc" in it[1..3]))
  result = Record(name: vals[0], count: count)

proc main() =
  var records = newSeq[Record]()
  var line = ""
  while stdin.readLine(line):
    records.add(createRecord(line.toLowerAscii().split('\t')))

  echo sum(records.mapIt(it.count))

main()
