use std::io::stdin;
use std::io::prelude::*;


#[derive(Debug)]
struct Record {
    pub name: String,
    pub count: usize
}

impl Record {
    pub fn new(name: String, count: usize) -> Record {
        Record { name, count }
    }
}


fn create_record(line: &str) -> Record {
    let iter = line.split('\t');
    let name = iter.clone().next().unwrap().to_string();
    let count = iter.filter(|s| s[1..4].contains("bc")).count();
    Record::new(name, count)
}


fn main() {
    let mut records = vec![];
    let mut buffer = String::new();
    let stdin = stdin();
    let mut input = stdin.lock();
    loop {
        match input.read_line(&mut buffer) {
            Ok(0) => break,
            Ok(_) => {},
            Err(e) => panic!("{:?}", e)
        }
        buffer.make_ascii_lowercase();
        records.push(create_record(&buffer));
        buffer.clear();
    }
    let count: usize = records.iter().map(|r| r.count).sum();
    println!("{}", count);
    println!("{:?}", &records[0])
}


