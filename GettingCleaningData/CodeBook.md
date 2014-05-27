
###Data Convert Steps

Following data transformations are carried out by the run_analysis.R script.

For each of the training and test datasets,
Read the X values
Take a subset of the columns representing only the mean and standard deviation values. Subsetting is done early on to conserve memory.
Associate additional columns to represent activity IDs and subject IDs read from y_<dataset>.txt and subject_<dataset>.txt files respectively.
Assign column names by manipulating the measurement names in features.txt to remove spaces and convert them to camel case.
Merge the training and the test sets, read as in step 1 to create one data set.
Associate an additional column with descriptive activity names as specified in activity_labels.txt.
Melt the dataset by specifying activity ID, name and subject ID as the only ID variables.
Re cast the melted dataset with activity name and subject id as the only IDs and mean as the aggregator function.
Save the result in re-casted dataset as tidy.txt


According to data transformations are performed by the run_analysis.R script.

For each of the train and test data sets
Read the X values
Take a subset of the columns that only the averages and standard deviations. Subgroups is done to save early to memory.
Associate additional columns to the activity IDs and are subject to las represent IDs from y_ <dataset> . Txt and subject_ <dataset> . Txt files to .
Remove Assign column names by manipulation of the measurement name in features.txt spaces and transform them into camel case .
Perform the training and test sets , you can read how to create in step 1 on a record.
Link given an additional column with descriptive names like activity in activity_labels.txt .
Melt the amount of data by specifying the activity ID , name and subject ID as a single ID variable.
Re throw the melted record with the name and activity id as the only subject IDs and mean as an aggregator function. Save the result in the re- cast dataset as tidy.txt



###Variable Description

The data for this record was mentioned from the " original data " section in this document sources. Part of the description was taken from the original data description below.

The selected for this database features come from the accelerometer and gyroscope 3 - axial raw signals tACC - and XYZ - XYZ tGyro . These timing signals (prefix "t" denotes the time ) have been recorded at a constant rate of 50 Hz . Then they were filtered with a median filter and a low pass 3rd order Butterworth filter with a cutoff frequency of 20 Hz to remove noise. The acceleration signal is then in the body and the gravity acceleration signals ( tBodyAcc - tGravityAcc XYZ - and XYZ) separated by another low pass Butterworth filter with a cutoff frequency of 0.3 Hz .

Subsequently, the bodies were linear acceleration and angular rate derived in the time to jerk signals ( tBodyAccJerk - and XYZ - tBodyGyroJerk XYZ) to obtain . Also, the extent of this three-dimensional signals were calculated using the Euclidean norm ( tBodyAccMag , tGravityAccMag , tBodyAccJerkMag , tBodyGyroMag , tBodyGyroJerkMag ) .

Finally a Fast Fourier Transform (FFT) has been to some of these signals producing fBodyAcc - applied fBodyGyro , fBodyAccJerkMag , fBodyGyroMag , fBodyGyroJerkMag - XYZ, fBodyAccJerk - XYZ, XYZ. (Note , enter " f" in the frequency domain signals ) .

These signals were used to estimate variables of the feature vector for each sample : " XYZ" is used three -axis signals in the X - Y, and to indicate the Z-direction .


####Estimated variables from these signals are:
-mean: Mean value
-std: Standard deviation

###Data Columns
```{r}
ActivityName: Activity being performed
SubjectID: ID indicating the subject from whom data was collected
tBodyAccMeanX
tBodyAccMeanY
tBodyAccMeanZ
tBodyAccStdX
tBodyAccStdY
tBodyAccStdZ
tGravityAccMeanX
tGravityAccMeanY
tGravityAccMeanZ
tGravityAccStdX
tGravityAccStdY
tGravityAccStdZ
tBodyAccJerkMeanX
tBodyAccJerkMeanY
tBodyAccJerkMeanZ
tBodyAccJerkStdX
tBodyAccJerkStdY
tBodyAccJerkStdZ
tBodyGyroMeanX
tBodyGyroMeanY
tBodyGyroMeanZ
tBodyGyroStdX
tBodyGyroStdY
tBodyGyroStdZ
tBodyGyroJerkMeanX
tBodyGyroJerkMeanY
tBodyGyroJerkMeanZ
tBodyGyroJerkStdX
tBodyGyroJerkStdY
tBodyGyroJerkStdZ
tBodyAccMagMean
tBodyAccMagStd
tGravityAccMagMean
tGravityAccMagStd
tBodyAccJerkMagMean
tBodyAccJerkMagStd
tBodyGyroMagMean
tBodyGyroMagStd
tBodyGyroJerkMagMean
tBodyGyroJerkMagStd
fBodyAccMeanX
fBodyAccMeanY
fBodyAccMeanZ
fBodyAccStdX
fBodyAccStdY
fBodyAccStdZ
fBodyAccJerkMeanX
fBodyAccJerkMeanY
fBodyAccJerkMeanZ
fBodyAccJerkStdX
fBodyAccJerkStdY
fBodyAccJerkStdZ
fBodyGyroMeanX
fBodyGyroMeanY
fBodyGyroMeanZ
fBodyGyroStdX
fBodyGyroStdY
fBodyGyroStdZ
fBodyAccMagMean
fBodyAccMagStd
fBodyBodyAccJerkMagMean
fBodyBodyAccJerkMagStd
fBodyBodyGyroMagMean
fBodyBodyGyroMagStd
fBodyBodyGyroJerkMagMean
fBodyBodyGyroJerkMagStd
```


