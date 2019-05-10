#/usr/sh
# Generate test file
awk 'BEGIN{for (i=0; i<2000000; i++){print "abcdef\tghijk\tlmnop\tqrstuv\twxyz1234\tABCDEF\tHIJK\tLMNOP\tQRSTUV\tWXYZ123"}}' > big.tsv

# Compile and run the programs
echo 'Python'
time < big.tsv python3 ./count_lines.py 

echo 'Perl'
time < big.tsv perl count_lines.pl

# dmd -release ./count_lines_d.d >/dev/null 2>&1
# echo 'Dlang dmd'
# time < big.tsv  ./count_lines_d

ldc2 -release ./count_lines_d.d # >/dev/null 2>&1
echo 'Dlang ldc'
time < big.tsv  ./count_lines_d

nim c -d:release count_lines_nim.nim >/dev/null 2>&1
echo 'Nim'
time < big.tsv  ./count_lines_nim

nim c -d:release --threads:on count_lines_parallel_nim.nim >/dev/null 2>&1
echo 'Nim Parallel'
time < big.tsv ./count_lines_parallel_nim 

echo 'R Base'
time < big.tsv Rscript ./count_lines_base.R

echo 'R Parallel'
time < big.tsv Rscript ./count_lines_parallel.R

echo 'R Dplyr'
time < big.tsv Rscript ./count_lines_dplyr.R

echo 'Rust'
pushd rust > /dev/null
cargo build --release
popd > /dev/null
time < big.tsv ./rust/target/release/count_lines

# crystal build count_lines_cr.cr --release >/dev/null 2>&1
# echo 'Crystal'
# time < big.tsv  ./count_lines_cr

echo 'gawk'
time < big.tsv gawk -F'\t' '{for (i=1; i <= NF; i++) {if (index(tolower(substr($i, 1, 3)), "bc") != 0) {count++}}}END{print count}'
