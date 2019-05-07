

library(data.table)
file <- commandArgs(trailingOnly=T)
df <- fread('cat /dev/stdin', header=F, sep="\t")
total <- 0L
for(x in df) {
    total <- total + sum(grepl("bc", x, ignore.case=T))
}
print(total)
