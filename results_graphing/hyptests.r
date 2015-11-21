table_engine = read.csv(file="engine_result.tsv", header=TRUE, sep="\t")

# Length vs Result
attach(table_engine)
groupFactor = as.factor(length)
tapply(result, groupFactor, summary)
lengthAnova = aov(result ~ groupFactor)

# Engine vs Result
groupFactor = as.factor(engine)
tapply(result, groupFactor, summary)
engineAnova = aov(result ~ groupFactor)
detach(table_engine)

summary(lengthAnova)
TukeyHSD(lengthAnova)
summary(engineAnova)

bartlett.test(result ~ length, data=table)
bartlett.test(result ~ engine, data=table)
