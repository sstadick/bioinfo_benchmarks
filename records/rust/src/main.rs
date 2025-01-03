use std::io::prelude::*;
use std::io::stdin;

struct Record {
    pub name: String,
    pub count: usize,
}

impl Record {
    pub fn new(name: String, count: usize) -> Record {
        Record { name, count }
    }
}

fn create_record(line: &str) -> Record {
    let mut iter = line.split('\t');
    let name = iter.next().unwrap();
    let count = std::iter::once(name)
        .chain(iter)
        .filter(|s| s[1..4].contains("bc"))
        .count();
    Record::new(name.to_string(), count)
}

fn main() {
    let mut records = vec![];
    let mut buffer = String::new();
    let stdin = stdin();
    let mut input = BufReader::new(stdin.lock());
    while let Ok(bytes_read) = input.read_line(&mut buffer) {
        if bytes_read == 0 {
            break;
        }
        buffer.make_ascii_lowercase();
        records.push(create_record(&buffer));
        buffer.clear();
    }
    let count: usize = records.iter().map(|r| r.count).sum();
    println!("{}", count);
}
