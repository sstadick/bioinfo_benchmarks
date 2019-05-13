use std::io::stdin;
use std::io::prelude::*;


fn main() {
    let mut buffer = String::new();
    let stdin = stdin();
    let mut input = stdin.lock();
    let mut count = 0;
    loop {
        match input.read_line(&mut buffer) {
            Ok(0) => break,
            Ok(_) => {},
            Err(e) => panic!("{:?}", e)
        }
        buffer.make_ascii_lowercase();
        count += buffer.split('\t')
            .filter(|s| s[1..4].contains("bc"))
            .count();
        buffer.clear();
    }
    println!("{}", count);
}


