# Some Dubious and Pragmatic Benchmarks

This repo contains code for evaluating languages to use for string heavy programs (bioinformatics).

The benchmarks are not trying to find the fastest way to solve the problem of count the number of fields in the file, they are just meant to demonstrate the following:

1. Scriptability - How easy is it to read from stdin and split lines?
2. IO - Is there something inherently slow about how the language deals with IO?
3. String Ops - Are the builtins for doing string manipulations efficient, or do they just look pretty?
4. Lightweight Classes - can we cheaply create a class to hold data?
5. Array and String allocations - Does the compiler / interpreter optimize allocations? 
6. (Not yet done) C binding - How easy is it to use a c library?
7. (Not yet done) C interop - Is there a large cost to interacting with C libraries?

## Results

Lang | Time
---|---
Python3 | 0m8.727s
Perl | 0m12.491s*
D | 0m10.203s
Nim | 0m5.962s

* See Implementation notes

## Language version for results

Python 3.6
Perl 5.26
Nim 0.19
Dlang (dmd) v2.085.1

## Implementation Notes

I chose to use a class in Python because in a real life scenario, I would create a dataclass to take advantage of mypy / the type system. Classes are a little bit slower though. In Perl, I would likely not have used a class, since there is no real type benefit to doing so. I used Moo here just level the playing field. If dicts are uses in the Perl and Python versions, they both go to about 7.5s, with Perl having a slight edge.
