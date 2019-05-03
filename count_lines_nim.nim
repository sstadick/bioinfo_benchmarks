import strutils, sequtils, math

type
  Record = object
    name: string
    count: int

proc createRecord(vals: seq[string]): Record =
  var count = len(vals.filterIt("bc" in toLower(it[1..3])))
  result = Record(name: vals[0], count: count)

proc main() =
  var records = newSeq[Record]()
  for line in stdin.lines:
    records.add(createRecord(line.split('\t')))

  echo sum(records.mapIt(it.count))

main()
