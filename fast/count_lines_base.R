

library(data.table)
file <- commandArgs(trailingOnly=T)
df <- fread('cat /dev/stdin', header=F, sep="\t")
total <- 0L
for(x in df) {
    total <- total + sum(grepl("bc", substr(x, 2, 4), ignore.case=T))
}
print(total)
