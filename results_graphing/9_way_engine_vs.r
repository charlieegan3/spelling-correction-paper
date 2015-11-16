require(ggplot2)
require(gridExtra)

library(scales)

mtcars = read.csv(file="mtcars.csv", header=TRUE, sep=";")
table = read.csv(file="engine_result.tsv", header=TRUE, sep="\t")
attach(table)

plot1 <- ggplot(table[table$engine=='ask',], aes(y=table[table$engine=='ask',]$result, x=factor(table[table$engine=='ask',]$length))) +
         geom_bar(stat="identity", fill="grey") +
         scale_y_continuous(labels=percent, limits = c(0,0.3)) +
         ylab("") + xlab("") + ggtitle("Ask") + theme_bw() + theme(plot.title = element_text(size=11)) +
         theme(axis.text.x = element_text(size=8)) + scale_x_discrete(limits=c("4 chars","8 chars","12 chars"))
plot2 <- ggplot(table[table$engine=='baidu',], aes(y=table[table$engine=='baidu',]$result, x=factor(table[table$engine=='baidu',]$length))) +
         geom_bar(stat="identity", fill="grey") +
         scale_y_continuous(labels=percent, limits = c(0,0.3)) +
         ylab("") + xlab("") + ggtitle("Baidu") + theme_bw() + theme(plot.title = element_text(size=11)) +
         theme(axis.text.x = element_text(size=8)) + scale_x_discrete(limits=c("4 chars","8 chars","12 chars"))
plot3 <- ggplot(table[table$engine=='bing',], aes(y=table[table$engine=='bing',]$result, x=factor(table[table$engine=='bing',]$length))) +
         geom_bar(stat="identity", fill="grey") +
         scale_y_continuous(labels=percent, limits = c(0,0.3)) +
         ylab("") + xlab("") + ggtitle("Bing") + theme_bw() + theme(plot.title = element_text(size=11)) +
         theme(axis.text.x = element_text(size=8)) + scale_x_discrete(limits=c("4 chars","8 chars","12 chars"))
plot4 <- ggplot(table[table$engine=='duckduckgo',], aes(y=table[table$engine=='duckduckgo',]$result, x=factor(table[table$engine=='duckduckgo',]$length))) +
         geom_bar(stat="identity", fill="grey") +
         scale_y_continuous(labels=percent, limits = c(0,0.3)) +
         ylab("") + xlab("") + ggtitle("DuckDuckGo") + theme_bw() + theme(plot.title = element_text(size=11)) +
         theme(axis.text.x = element_text(size=8)) + scale_x_discrete(limits=c("4 chars","8 chars","12 chars"))
plot5 <- ggplot(table[table$engine=='google',], aes(y=table[table$engine=='google',]$result, x=factor(table[table$engine=='google',]$length))) +
         geom_bar(stat="identity", fill="grey") +
         scale_y_continuous(labels=percent, limits = c(0,0.3)) +
         ylab("") + xlab("") + ggtitle("Google") + theme_bw() + theme(plot.title = element_text(size=11)) +
         theme(axis.text.x = element_text(size=8)) + scale_x_discrete(limits=c("4 chars","8 chars","12 chars"))
plot6 <- ggplot(table[table$engine=='sogou',], aes(y=table[table$engine=='sogou',]$result, x=factor(table[table$engine=='sogou',]$length))) +
         geom_bar(stat="identity", fill="grey") +
         scale_y_continuous(labels=percent, limits = c(0,0.3)) +
         ylab("") + xlab("") + ggtitle("Sogou") + theme_bw() + theme(plot.title = element_text(size=11)) +
         theme(axis.text.x = element_text(size=8)) + scale_x_discrete(limits=c("4 chars","8 chars","12 chars"))
plot7 <- ggplot(table[table$engine=='yahoo',], aes(y=table[table$engine=='yahoo',]$result, x=factor(table[table$engine=='yahoo',]$length))) +
         geom_bar(stat="identity", fill="grey") +
         scale_y_continuous(labels=percent, limits = c(0,0.3)) +
         ylab("") + xlab("") + ggtitle("Yahoo") + theme_bw() + theme(plot.title = element_text(size=11)) +
         theme(axis.text.x = element_text(size=8)) + scale_x_discrete(limits=c("4 chars","8 chars","12 chars"))
plot8 <- ggplot(table[table$engine=='yandex',], aes(y=table[table$engine=='yandex',]$result, x=factor(table[table$engine=='yandex',]$length))) +
         geom_bar(stat="identity", fill="grey") +
         scale_y_continuous(labels=percent, limits = c(0,0.3)) +
         ylab("") + xlab("") + ggtitle("Yandex") + theme_bw() + theme(plot.title = element_text(size=11)) +
         theme(axis.text.x = element_text(size=8)) + scale_x_discrete(limits=c("4 chars","8 chars","12 chars"))
plot9 <- ggplot(table[table$engine=='youdao',], aes(y=table[table$engine=='youdao',]$result, x=factor(table[table$engine=='youdao',]$length))) +
         geom_bar(stat="identity", fill="grey") +
         scale_y_continuous(labels=percent, limits = c(0,0.3)) +
         ylab("") + xlab("") + ggtitle("Youdao") + theme_bw() + theme(plot.title = element_text(size=11)) +
         theme(axis.text.x = element_text(size=8)) + scale_x_discrete(limits=c("4 chars","8 chars","12 chars"))

pdf("eng_vs_acc_9_way.pdf")
grid.arrange(plot1, plot2, plot3, plot4, plot5, plot6, plot7, plot8, plot9, ncol=3, nrow=3)
dev.off()
