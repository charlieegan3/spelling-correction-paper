require(ggplot2)
library(scales)

table = read.csv(file="engine_result.tsv", header=TRUE, sep="\t")
attach(table)

resultMean = mean(result)
table$diffs = abs(result - resultMean)

pdf("residual_histogram.pdf")

ggplot(table, aes(x=diffs)) +
geom_histogram(binwidth = 0.02, fill="grey") +
theme_bw() +
scale_x_continuous(labels=percent, limits = c(0,0.17)) +
ggtitle("Histogram of Percentage Residuals") +
theme(panel.grid.major = element_blank()) +
ylab("Frequency") +
xlab("Absolute Residuals")

dev.off()
