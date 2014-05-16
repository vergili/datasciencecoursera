
# Returns one data set by reading and merging all component files.
# Data set comprises of the X values, Y values and Subject IDs.
# The path_prefix indicates the path where the data files can be found.
# The fname_suffix indicates the file name suffix to be used to create the complete file name.
#
# This also subsets the data to extract only the measurements on the mean and standard deviation for each measurement.
# The required columns in the subset is determined by selecting only those columns that have either "mean()" or "std()" in their names.
# Subsetting is done early on to help reduce memory requirements.


readData <- function(suffix) {

    suffix ="test"	

    #reading of y data file
    currentPath <- file.path(suffix, paste0("y_",suffix, ".txt"))
    yData <- read.table(currentPath , header=F, col.names=c("ActivityID"))
    
    #reading of subject data file	
    currentPath <- file.path(suffix, paste0("subject_",suffix, ".txt"))
    subjectData <- read.table(currentPath , header=F, col.names=c("SubjectID"))
    
    # reading of columns names
    columnsData <- read.table("features.txt", header=F, col.names=c("MeasureID", "MeasureName"))
    
    # reading of X data files
    currentPath <- file.path(suffix, paste0("X_", suffix, ".txt"))
    xData <- read.table(currentPath , header=F, col.names=columnsData$MeasureName)

  
    # subset of columns data required  
    subsetOfColumnsData <- grep(".*mean\\(\\)|.*std\\(\\)", columnsData$MeasureName)


    
    # subset the data (done early to save memory)
    xData <- xData[,subsetOfColumnsData]
    
    # append the activity id and subject id columns
    xData$ActivityID <- yData$ActivityID
    xData$SubjectID <- subjectData$SubjectID
    
    # return the data
    xData
}