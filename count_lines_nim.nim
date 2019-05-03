import strutils, sequtils, math, tables

type
  Record = object
    name: string
    count: int

proc createRecord(vals: seq[string]): Record=
  var count = len(filter(vals, proc(x: string): bool = "bc" in toLower(x[1..4])))
  var record = Record(name: vals[0], count: count)
  return record

proc main() =
  var records = newSeq[Record]()
  for line in stdin.lines:
    records.add(createRecord(line.split('\t')))

  echo(sum(map(records, proc(r: Record): int = r.count)))

main()