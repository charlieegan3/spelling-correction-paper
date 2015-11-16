library(scales)
table = read.csv(file="engine_result.tsv", header=TRUE, sep="\t")
print(table)

# This data frame calculates statistics for each treatment.
data.summary <- data.frame(
    treatment=levels(table$length),
    mean=tapply(table$result, table$length, mean),
    n=tapply(table$result, table$length, length),
    sd=tapply(table$result, table$length, sd)
    )

data.summary$sem <- data.summary$sd/sqrt(data.summary$n)

pdf("len_vs_acc.pdf")
require(ggplot2)

ggplot(data.summary, aes(x = treatment, y = mean)) +
  geom_bar(position = position_dodge(), stat="identity", fill="grey", width=.5) +
  geom_errorbar(aes(ymin=mean-sem, ymax=mean+sem), width=0.1) +
  ggtitle("Word Length vs Mean Accuracy, 25% corruption") +
  theme_bw() +
  theme(panel.grid.major = element_blank()) +
  ylab("Mean Accuracy (with Standard Errors)") +
  xlab("") +
  scale_y_continuous(labels=percent, limits = c(0,0.3)) +
  scale_x_discrete(limits=c("4 chars","8 chars","12 chars"))

dev.off()
