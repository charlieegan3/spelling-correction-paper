library(scales)
table = read.csv(file="engine_result.tsv", header=TRUE, sep="\t")
print(table)

# This data frame calculates statistics for each treatment.
data.summary <- data.frame(
    treatment=levels(table$engine),
    mean=tapply(table$result, table$engine, mean),
    n=tapply(table$result, table$engine, length),
    sd=tapply(table$result, table$engine, sd)
    )

data.summary$sem <- data.summary$sd/sqrt(data.summary$n)

pdf("eng_vs_acc.pdf")
require(ggplot2)

ggplot(data.summary, aes(x = treatment, y = mean)) +
  geom_bar(position = position_dodge(), stat="identity", fill="grey") +
  geom_errorbar(aes(ymin=mean-sem, ymax=mean+sem), width=0.3) +
  ggtitle("Average search engine accuracy") +
  theme_bw() +
  theme(panel.grid.major = element_blank()) +
  ylab("Mean Accuracy (with Standard Errors)") +
  xlab("") +
  scale_y_continuous(labels=percent, limits = c(0,0.3)) +
  scale_x_discrete(breaks=c("ask","baidu","bing","duckduckgo","google","sogou","yahoo","yandex","youdao"), labels=c("Ask", "Baidu", "Bing", "DuckDuckGo", "Google", "Sogou", "Yahoo", "Yandex", "Youdao")) +
  theme(axis.text.x = element_text(size=8))

dev.off()
