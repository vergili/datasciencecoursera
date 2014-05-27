

### Detail of Analysis

This scripts returns a tiny dataset by reading two set of data (test and train)
the scripts merges the train and test sets and create one dataset
It subset the merged data to extract only the measurements on the 
mean and standard deviation for each measurement. 
It Uses descriptive activity names to name the activities in the data set
finally the tidy data includes average of each variable for each avtivity and subjects       
-the parameter of readDataParts function (suffix) is equal to  "test" or "train" 
-Note: Do not forget to set working directory to your data location like below
-setwd("D:/work/coursera/UCI HAR Dataset")


###Data Set Variables Definitions

The experiments were carried out with a group of 30 volunteers in an age group 19-48 years. Each person performed six activities (hiking, WALKING_UPSTAIRS , WALKING_DOWNSTAIRS , Sitting , Standing , Laying ) carries a smartphone ( Samsung Galaxy S II ) at the waist. Data is collected via the integrated accelerometer and gyroscope 3 - axial Linearbeschleunigungund 3 - axial angular velocity at a constant rate of 50Hz . The experiments were recorded on video in order to label the data manually. The amount of data obtained was distributed at random in two groups, where 70% of the volunteers were selected for the generation of the training data and 30% of the test data.

The sensor signals (accelerometer and gyroscope) were preprocessed by applying noise filter and then sampled in fixed-width sliding window of 2.56 sec and 50 % overlap (128 measurements / window). The acceleration sensor signal, comprising gravity and the body motion component has been separated by using a Butterworth Tiefpassfilterin the body acceleration and the gravity. The gravitational force, it is assumed that only low-frequency components, have been used a filter with 0.3 Hz cut-off frequency . From every window, a vector of characteristics was obtained by calculating variables from the time and frequency domain .

####Property Information:
Each record in the dataset provided by:
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration. 
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.


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


