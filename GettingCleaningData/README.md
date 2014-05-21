How To Run analysis.R script
========================================================

This scripts returns a tiny dataset by reading two set of data (test and train)
the scripts merges the train and test sets and create one dataset
It subset the merged data to extract only the measurements on the 
mean and standard deviation for each measurement. 
It Uses descriptive activity names to name the activities in the data set
finally the tidy data includes average of each variable for each avtivity and subjects       

the parameter of readDataParts function (suffix) is equal to  "test" or "train" 
Note: Do not forget to set working directory to your data location like below
setwd("D:/work/coursera/UCI HAR Dataset")


running scripts
##Get this  repository 
##Download the dataset and extract. The name of dataset folder is UCI HAR Dataset. "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
##Set working directory to   UCI HAR Dataset folder. like below
##setwd("D:/work/coursera/UCI HAR Dataset")
##Run script <path to>/run_analysis.R
##The tidy dataset will be created  in working directory (UCI HAR Dataset) tidyData.txt
