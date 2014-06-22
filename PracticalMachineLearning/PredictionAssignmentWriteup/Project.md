Practical Machine Learning - Prediction Assignment Writeup
==========================================================

Introduction
------------

The purpose of the this analysis is to build a model to understand lifts exercices classe (A,B,C,D,E).
Six young health participants were asked to perform one set of 10 repetitions of the Unilateral Dumbbell Biceps Curl in five different fashions:

Classe A: exactly according to the specification

Classe B: throwing the elbows to the front

Classe C: lifting the dumbbell only halfway

Classe D: lowering the dumbbell only halfway

Classe E: throwing the hips to the front

Data stored from accelerometers on belt, arm, forearm and dumbell. See below picture

<img class=center src=fig/on-body-sensing-schema.png height=400>

Read more: http://groupware.les.inf.puc-rio.br/har#ixzz35ImUnnNL

Model: 
-------------
If we look the data we have 60 couloms from different measurements. 
If we use all of this variables the prediction will take a lot of time. To reduece time measurement
we can select part of couloms which are directly related prediction. 
According to picture all accelerometers has coordinates measurements and according to defination of
classe all classification related with coordinates of belt, arm, forearm and dumbell.
So in 60 couloms there are a lot of coordinate components but if we select coordinates related with "magnet"
it will be good enough for prediction. On the other hand we can cross check how it will work if we select only
magnet components. 

To estimate and cross check i used caret and randomForest packages.
-------------

```r
library(caret)
```

```
## Loading required package: lattice
## Loading required package: ggplot2
```

```r
library(randomForest)
```

```
## randomForest 4.6-7
## Type rfNews() to see new features/changes/bug fixes.
```

Reading the training data
-------------------------
The training data are downloaded directly from the web url provided by Coursera.  
All variables with an empty string are considered as NA.

```r
#fileurl <- "https://d396qusza40orc.cloudfront.net/predmachlearn/pml-training.csv"
#download.file(fileurl, destfile = "pml-training.csv" )

trainData <- read.csv("pml-training.csv", stringsAsFactors = FALSE, , header = TRUE,sep=",",na.string=c("NA",""))
```

Traning Data 
----------------------------
Since 'classe'  variable is the outcome to predict  it is converted to factor. 

```r
trainData$classe<-as.factor(trainData$classe)
```

All NA elements are removed

```r
NAcols <- apply(trainData,2,function(x) {sum(is.na(x))}) 
trainData <- trainData[,which(NAcols == 0)]
```

Select only magnet components for prediction. This will be easy for us because writing each coulom name 
is not easy during model training. Instead  we can just use "."

```r
subsetOfCoordinates <- grep("magnet_*| *classe", colnames(trainData))
trainData = trainData[,subsetOfCoordinates]
```

Validation of Model : Splitting the training set in 2 
--------------------------
1. 70 % of orignal training dataset.  
2. 30% of orignal training dataset.
We will use 70% of data as a train and 30% of data as a test dataset  to cross check and estimate out of sample 
error.


```r
inTrain<-createDataPartition(y=trainData$classe,p=0.70,list=FALSE)
trainDataTrain70 <- trainData[inTrain,]
trainDataTest30 <- trainData[-inTrain,]
```

Training the model in random forest method
-------------------------------------

```r
modelRF<-train(classe~ .,data=trainDataTrain70,method="rf",allowParallel=T)
modelRF
```

```
## Random Forest 
## 
## 13737 samples
##    12 predictors
##     5 classes: 'A', 'B', 'C', 'D', 'E' 
## 
## No pre-processing
## Resampling: Bootstrapped (25 reps) 
## 
## Summary of sample sizes: 13737, 13737, 13737, 13737, 13737, 13737, ... 
## 
## Resampling results across tuning parameters:
## 
##   mtry  Accuracy  Kappa  Accuracy SD  Kappa SD
##   2     1         0.9    0.003        0.003   
##   7     0.9       0.9    0.003        0.003   
##   10    0.9       0.9    0.005        0.006   
## 
## Accuracy was used to select the optimal model using  the largest value.
## The final value used for the model was mtry = 2.
```

calculating the in sample error rate of the final model


```r
in_error_rate<-1-(sum(predict(modelRF,trainDataTrain70)==trainDataTrain70$classe)/dim(trainDataTrain70)[1])
paste("In Sample Error Rate is ",in_error_rate)
```

```
## [1] "In Sample Error Rate is  0"
```

Using the trained model on the cross validation set
---------------------------------------------------

```r
pred<-predict(modelRF,trainDataTest30)
confusionMatrix(pred,trainDataTest30$classe)
```

```
## Confusion Matrix and Statistics
## 
##           Reference
## Prediction    A    B    C    D    E
##          A 1658   46    6   14    8
##          B    2 1046   18    4   11
##          C    4   25  993   24    6
##          D    9   18    6  920   12
##          E    1    4    3    2 1045
## 
## Overall Statistics
##                                         
##                Accuracy : 0.962         
##                  95% CI : (0.957, 0.967)
##     No Information Rate : 0.284         
##     P-Value [Acc > NIR] : < 2e-16       
##                                         
##                   Kappa : 0.952         
##  Mcnemar's Test P-Value : 6.23e-13      
## 
## Statistics by Class:
## 
##                      Class: A Class: B Class: C Class: D Class: E
## Sensitivity             0.990    0.918    0.968    0.954    0.966
## Specificity             0.982    0.993    0.988    0.991    0.998
## Pos Pred Value          0.957    0.968    0.944    0.953    0.991
## Neg Pred Value          0.996    0.981    0.993    0.991    0.992
## Prevalence              0.284    0.194    0.174    0.164    0.184
## Detection Rate          0.282    0.178    0.169    0.156    0.178
## Detection Prevalence    0.294    0.184    0.179    0.164    0.179
## Balanced Accuracy       0.986    0.955    0.978    0.973    0.982
```

```r
out_error_rate<- 1-(sum(pred==trainDataTest30$classe)/dim(trainDataTest30)[1])
paste("Out of Sample Error Rate is ",out_error_rate)
```

```
## [1] "Out of Sample Error Rate is  0.037892948173322"
```
According to prediction and error rate our estimation looks quite good. 

So this method will predict correct answer for 20 test for submission request.


Test Data Prediction 
-----------------------------

###Reading Testing file
---------------------------

```r
testData <- read.csv("pml-testing.csv", stringsAsFactors = FALSE, , header = TRUE,sep=",",na.string=c("NA",""))
```


###All NA elements are removed int Test Data

```r
NAcols <- apply(testData,2,function(x) {sum(is.na(x))}) 
testData <- testData[,which(NAcols == 0)]
```

Prediction for 20 test data from 1 to 20 respectively

```r
predTestData <-predict(modelRF,testData)
predTestData
```

```
##  [1] B A B A A E D B A A B C B A E E A B B B
## Levels: A B C D E
```






