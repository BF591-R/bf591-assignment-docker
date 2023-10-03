library(rmarkdown)

args <- commandArgs(trailingOnly=TRUE)

report_fn <- args[2]
html_fn <- args[3]

rmarkdown::render(report_fn, output_file=html_fn)
