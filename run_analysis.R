#   RCourse Getting and cleaning data Final Project


##Assignmen Intsructions
###You should create one R script called run_analysis.R that does the following. - DONE
##Merges the training and the test sets to create one data set. - DONE
##Extracts only the measurements on the mean and standard deviation for each measurement - DONE 
##Uses descriptive activity names to name the activities in the data set - DONE
##Appropriately labels the data set with descriptive variable names. -Done
##From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject-Done


##1) prelimenaries
packages <- c("data.table", "reshape2")
sapply(packages, require, character.only=TRUE, quietly=TRUE)

setwd("C:/Users/i57757/Documents/Scripts/Rcourse")
path<-getwd()


###download and unzip file:
if(!file.exists("./data")){dir.create("./data")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl,destfile="./data/Dataset.zip")

unzip(zipfile="./data/Dataset.zip",exdir="./data")  #unzip


###look at the list of files in the folder
filesxx <- file.path("./data" , "UCI HAR Dataset")
files<-list.files(filesxx, recursive=TRUE)
files 

### Read files: activity , subject and features: 
ActivityTest  <- read.table(file.path(filesxx, "test" , "Y_test.txt" ),header = FALSE)
ActivityTrain <- read.table(file.path(filesxx, "train", "Y_train.txt"),header = FALSE)

SubjectTrain <- read.table(file.path(filesxx, "train", "subject_train.txt"),header = FALSE)
SubjectTest  <- read.table(file.path(filesxx, "test" , "subject_test.txt"),header = FALSE)


FeaturesTest  <- read.table(file.path(filesxx, "test" , "X_test.txt" ),header = FALSE)
FeaturesTrain <- read.table(file.path(filesxx, "train", "X_train.txt"),header = FALSE)

###get an understanding of the files:
names(ActivityTest)
dim(ActivityTest)
summary(ActivityTest)

names(ActivityTrain)
dim(ActivityTrain)
summary(ActivityTrain)

names(SubjectTrain)
dim(SubjectTrain)
summary(SubjectTrain)

names(SubjectTest)
dim(SubjectTest)
summary(SubjectTest)

names(FeaturesTest)
dim(FeaturesTest)
summary(FeaturesTest)

names(FeaturesTrain)
dim(FeaturesTrain)
summary(FeaturesTrain)


## 2) Merge
###concatonate the testing and training datasets
dataSubject <- rbind(SubjectTrain, SubjectTest)
dataActivity<- rbind(ActivityTrain, ActivityTest)
dataFeatures<- rbind(FeaturesTrain, FeaturesTest)

###change the names from "Vs" to meaningful titles
names(dataSubject)<-c("subject")
names(dataActivity)<- c("activity")
dataFeaturesNames <- read.table(file.path(filesxx, "features.txt"),head=FALSE)
names(dataFeatures)<- dataFeaturesNames$V2

###and finally merge into a new data frame called Data
dataCombine <- cbind(dataSubject, dataActivity)
head(dataCombine)
Data <- cbind(dataFeatures, dataCombine)
dim(Data)  #10299   563


##study the averages and stdv 
MeanSTD <- grep(".*Mean.*|.*Std.*", dataFeaturesNames$V2, ignore.case=TRUE)
MeanSTDColumns <- c(MeanSTD, 562, 563)
Data1 <- Data[,MeanSTDColumns]
dim(Data1)  #10299    88
str(Data1)


##name the activities in the data set
###The activity field is originally numeric.We need to switch to charachter first. 
activityLabels <- read.table(file.path(filesxx, "activity_labels.txt"),header = FALSE)
Data1$activity <- as.character(Data$activity)
activityLabels$V2<-as.character(activityLabels$V2)
for (i in 1:6){
        Data$activity[Data$activity == i] <- (activityLabels[i,2])
}

head(Data$activity,30)


##Label the Data with descriptive Variables

names(Data)<-gsub("^t", "time", names(Data))  # t=time time
names(Data)<-gsub("^f", "frequency", names(Data))  #f=frequency
names(Data)<-gsub("Acc", "Accelerometer", names(Data))  #Acc = Accelerometer
names(Data)<-gsub("Gyro", "Gyroscope", names(Data)) #Gyro=Gyroscope
names(Data)<-gsub("Mag", "Magnitude", names(Data))  #Mag=Magnitude
names(Data)<-gsub("BodyBody", "Body", names(Data))  #BodyBody=Body

head(Data)
names(Data)

##From the data set in step 4 (Data1), create an independent tidy data set with the average of each variable for each activity and each subject.

library(plyr);
Data2<-aggregate(. ~subject + activity, Data1, mean,na.action = na.omit)
Data2<-Data2[order(Data2$subject,Data2$activity),]
head(Data2)
write.table(Data2, file = "tidydata.txt",row.name=FALSE)
dim(Data2) # 180 88



