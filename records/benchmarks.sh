#/usr/sh
# Generate test file
awk 'BEGIN{for (i=0; i<2000000; i++){print "abcdef\tghijk\tlmnop\tqrstuv\twxyz1234\tABCDEF\tHIJK\tLMNOP\tQRSTUV\tWXYZ123"}}' > big.tsv

cat big.tsv > /dev/null
# Compile and run the programs
echo 'Python'
time < big.tsv python3 ./count_lines.py 

echo 'pypy3 Python'
time < big.tsv pypy3 ./count_lines.py

echo 'Perl'
time < big.tsv perl count_lines.pl

kotlinc ./count_lines.kt -d ./count_lines.jar -include-runtime
echo 'Kotlin'
time < big.tsv java -jar ./count_lines.jar

ldc2 -release ./count_lines_d.d  >/dev/null 2>&1
echo 'Dlang ldc'
time < big.tsv  ./count_lines_d

nim c -d:release --passC:-march=native --passC:-flto count_lines_nim.nim >/dev/null 2>&1
echo 'Nim'
time < big.tsv  ./count_lines_nim

echo 'Rust'
pushd rust > /dev/null
cargo build --release >/dev/null 2>&1
popd > /dev/null
time < big.tsv ./rust/target/release/count_lines
