#/usr/sh
# Generate test file
awk 'BEGIN{for (i=0; i<2000000; i++){print "abcdef\tghijk\tlmnop\tqrstuv\twxyz1234\tABCDEF\tHIJK\tLMNOP\tQRSTUV\tWXYZ123"}}' > big.tsv
cat big.tsv > /dev/null
# Compile and run the programs
echo 'Perl Regexy'
time <big.tsv perl ./count_lines_perlish.pl

echo 'Python'
time < big.tsv python3 ./count_lines.py 

echo 'pypy3'
time < big.tsv pypy3 ./count_lines.py

echo 'pypy3 low'
time < big.tsv pypy3 ./count_lines_low.py

echo 'Perl'
time < big.tsv perl count_lines.pl

ldc2 -release ./count_lines_d.d  >/dev/null 2>&1
echo 'Dlang ldc'
time < big.tsv  ./count_lines_d

nim c -d:release --passC:-march=native --passC:-flto count_lines_nim.nim >/dev/null 2>&1
echo 'Nim'
time < big.tsv  ./count_lines_nim

nim c -d:release --passC:-march=native --passC:-flto count_lines_custom_nim.nim >/dev/null 2>&1
echo 'Nim Custom'
time < big.tsv  ./count_lines_custom_nim

nim c -d:release --passC:-march=native --passC:-flto count_lines_low_nim.nim >/dev/null 2>&1
echo 'Nim Low'
time < big.tsv  ./count_lines_low_nim

nim c -d:release --threads:on --passC:-march=native --passC:-flto count_lines_parallel_nim.nim >/dev/null 2>&1
echo 'Nim Parallel'
time < big.tsv ./count_lines_parallel_nim 

nim c -d:release --threads:on --passC:-march=native --passC:-flto count_lines_parallel_simple_nim.nim >/dev/null 2>&1
echo 'Nim Parallel Simple'
time < big.tsv ./count_lines_parallel_simple_nim 

echo 'R Base'
time < big.tsv Rscript ./count_lines_base.R

echo 'R Parallel'
time < big.tsv Rscript ./count_lines_parallel.R

# echo 'R Dplyr'
# time < big.tsv Rscript ./count_lines_dplyr.R

echo 'Rust'
pushd rust > /dev/null
cargo build --release
popd > /dev/null
time < big.tsv ./rust/target/release/count_lines

echo 'gawk'
time < big.tsv gawk -F'\t' '{for (i=1; i <= NF; i++) {if (index(tolower(substr($i, 1, 3)), "bc") != 0) {count++}}}END{print count}'
