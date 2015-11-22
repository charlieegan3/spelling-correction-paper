library(scales)
table = read.csv(file="engine_result.tsv", header=TRUE, sep="\t")
agg_table = aggregate(table[,c(2,4)], list(table$engine), mean)
agg_table

pdf("rank_scatter.pdf")

plot(agg_table$rank, agg_table$result, log="x", pch=19, main="Alexa Rank vs Average Accuracy", xlab="log(Alexa Rank)", ylab="Average Accuracy", yaxt="n") +
axis(2, at=pretty(agg_table$result), lab=paste0(pretty(agg_table$result) * 100, "%"), las=TRUE) +
text(agg_table$rank, agg_table$result, labels=agg_table$Group.1, cex= 0.7, pos=3)

dev.off()
