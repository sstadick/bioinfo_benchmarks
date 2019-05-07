library(data.table)
suppressMessages(library(dplyr))
suppressMessages(library(purrr))
file <- commandArgs(trailingOnly=T)
df <- fread('cat /dev/stdin', header=F, sep="\t")
map_int(df, ~sum(grepl("bc", .x, ignore.case=T))) %>% sum %>% print