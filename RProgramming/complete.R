complete<- function(directory, id = 1:332) {
  
  nobs = numeric(0)
  
  for(file in rep(id)){
    
    fileName <- sprintf("%s/%03d.csv", directory, file)
    
    data <- read.csv(fileName, sep=",", header=TRUE)
    
    data2 <- subset(data,sulfate!="NA" & nitrate!="NA")
    
    nobs[file] = nrow(data2)  
          
  }
  df <- data.frame(id,nobs)
  
  return(df)
}