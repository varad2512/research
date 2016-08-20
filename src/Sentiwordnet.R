library("tm")

setwd('C:\\Users\\DELL\\Desktop\\Research\\research\\src\\')

DF<-read.csv("dtm_matrix.csv")

dim(DF)


#dictionary has words and score associated with it
sentiWords <- read.csv("words.csv") 
dim(sentiWords)


ncount <- 0

for(i in names(DF)){
  if(grepl("^[A-Za-z]+$",i)){
    p <- paste("^",i,"$",sep = "")
    n <- grep(p,sentiWords$word)
    
    if(length(n) != 0){
      DF[[i]] <- DF[[i]]*1
      ncount <- ncount + 1
    }
    else{
      DF[[i]] <- NULL
    }
  }
  else{
    DF[[i]] <- NULL
  }
}


dim(DF)
dtm_matrix <- as.matrix(DF)
dim(dtm_matrix)
write.csv(dtm_matrix, file="dtm_matrix.csv") 