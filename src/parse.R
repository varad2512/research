
library(SnowballC)
library(tm)

setwd('C:\\Users\\DELL\\Desktop\\Research\\research\\src\\')


#file_loc <- "C:\\Users\\DELL\\Desktop\\Varad\\Research_Project\\tweets.csv"
#3 change TRUE to FALSE if you have no column headings in the CSV
#x <- read.csv(file_loc,header = TRUE )

myCorpus <- read.csv("Book1.csv",header=TRUE)
corpus <- Corpus(VectorSource(myCorpus$text))
corpus <- tm_map(corpus, content_transformer(tolower))
corpus <- tm_map(corpus, removePunctuation)
corpus <- tm_map(corpus, stripWhitespace)
corpus <- tm_map(corpus, removeWords, stopwords("english"))
dtm=DocumentTermMatrix(corpus)

dtm
dtm_matrix<- as.matrix(dtm)
dim(dtm_matrix)   
write.csv(dtm_matrix, file="dtm_matrix.csv") 
