# Some Dubious Benchmarks

This repo contains code for evaluating languages to use for string heavy programs (bioinformatics).

The benchmarks are not trying to find the fastest way to solve the problem of count the number of fields in the file, they are just meant to demonstrate the following:

1. Scriptability - how easy is it to read from stdin and split lines?
2. IO - Is there something inherently slow about how the language deals with IO?
3. String Ops - are the builtins for doing string manipulations efficient, or do they just look pretty?
4. Array and String allocations - Does the compiler / interpreter optimize allocations? 
5. (Not yet done) C binding - how easy is it to use a c library?
6. (Not yet done) C interop - is there a large cost to interacting with C libraries?
