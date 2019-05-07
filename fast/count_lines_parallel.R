

library(parallel)
library(data.table)
file <- commandArgs(trailingOnly=T)
df <- fread('cat /dev/stdin', header=F, sep="\t")
totals <- mclapply(df, function(x) {
    sum(grepl("bc", x, ignore.case=T))
}, mc.cores=ncol(df))
print(sum(unlist(totals)))
