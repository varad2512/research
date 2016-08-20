require(topicmodels)
require(tm)

setwd('C:\\Users\\DELL\\Desktop\\Research\\research\\src\\')


topics<-4
dtm<-read.csv(file = "dtm_final.csv",header = TRUE)
dtm[1]<-NULL
rowTotals <- apply(dtm , 1, sum) #Find the sum of words in each Document
dtm.new   <- dtm[rowTotals> 0, ]
#lda <- LDA(dtm.new,topics,method = "VEM")
lda<-LDA(dtm.new,topics,method="Gibbs")
terms(lda)
#topics(lda)