import java.io.File
import kotlin.text.*

data class Record(val name: String, val count: Int)
fun createRecord(vals: List<String>): Record {
    val c = vals.count {
        it.substring(1,4).contains("bc", true)
    }
    return Record(vals[0], c)
}

fun main() {
    var records: MutableList<Record> = mutableListOf<Record>()
    File("/dev/stdin").forEachLine(Charsets.US_ASCII) {
        records.add(createRecord(it.split('\t')))
    }
    println(records.sumBy{it.count})
}