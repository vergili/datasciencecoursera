# This scripts returns a tiny dataset by reading two set of data (test and train)
# the scripts merges the train and test sets and create one dataset
# It subset the merged data to extract only the measurements on the 
# mean and standard deviation for each measurement. 
# It Uses descriptive activity names to name the activities in the data set
# finally the tidy data includes average of each variable for each avtivity and subjects     	

# the parameter of readDataParts function (suffix) is equal to  "test" or "train" 
# Note: Do not forget to set working directory to your data location like below
# setwd("D:/work/coursera/UCI HAR Dataset")
#-------------------------------------------------------------

readDataParts <- function(suffix) {
  
  #reading of y data file
  currentPath <- file.path(suffix, paste0("y_", suffix, ".txt"))
  yData <- read.table(currentPath , header=F, col.names=c("activityID"))
  
  #reading of subject data file
  currentPath <- file.path(suffix, paste0("subject_", suffix, ".txt"))
  subjectData <- read.table(currentPath , header=F, col.names=c("subjectID"))
  
  # read the column names
  columnNames <- read.table("features.txt", header=F, as.is=T, col.names=c("measureID", "measureName"))
  
  # read the X data file
  currentPath  <- file.path(suffix, paste0("X_", suffix, ".txt"))
  xData <- read.table(currentPath , header=F, col.names=columnNames$measureName)
  
  # subset of mean and Std columns
  subsetOfMeanStd <- grep(".*mean\\(\\)|.*std\\(\\)", columnNames$measureName)
  
  # subset the data (done early to save memory)
  xData <- xData[,subsetOfMeanStd]
  
  # insert the activity and subject columns
  xData$activityID <- yData$activityID
  xData$subjectID <- subjectData$subjectID
  
  # return the data
  xData
}



# Merge train and test -> create complete data
# test data suffix ="test" , train data suffix="train"
# And also Add activity name to complete data 
#-------------------------------------------------------------
completeData<- function(data) {
  
  testTrainData <- rbind( readDataParts("test"), readDataParts("train") )
  
  cnames <- colnames(testTrainData)
  cnames <- gsub("\\.+mean\\.+", cnames, replacement="Mean")
  cnames <- gsub("\\.+std\\.+",  cnames, replacement="Std")
  colnames(testTrainData) <- cnames
  
  activities <- read.table("activity_labels.txt", header=F, as.is=T, col.names=c("activityID", "activityName"))
  activities$activityName <- as.factor(activities$activityName)
  data <- merge(testTrainData , activities)
  data
}

# create tidy data  the fileName="tidy.txt"
# the data has the average of each variable for each activity and each subject.
#-------------------------------------------------------------
createTidyData <- function() {
  library(reshape2)
  
  fileName = "tidyData.txt"
  
  idVars = c("activityID", "activityName", "subjectID")
  mvars = setdiff(colnames( completeData() ), idVars )
  mdata <- melt(completeData(), id=idVars, measure.vars=mvars)
  
  data <- dcast(mdata, activityName + subjectID ~ variable, mean)
  
  write.table(data, fileName)    
}

createTidyData()
print("Finished... Look at your workspace to see tidyData.txt file")






