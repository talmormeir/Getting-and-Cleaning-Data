
##Introduction
The script run_analysis.R downloads the data from UCI Machine Learning Repository. Data can be found at: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

This analysis makes use of 6 (3 for training + 3 for testing) datasets:

1.Activity - 6 types of physical activities 

2.Subject - identification of the subjects in the study

3.Feature - measurement values of the attributes used for modeling
  
The script merges the training and test sets to create one data set; replaces activity values in the dataset with descriptive activity names; extracts mean and stdv attributes; labels the columns with descriptive names; and creates a second, independent tidy dataset with an average of each feature for each each activity and each subject (txt file included in this repository). 

##Data Dimensions
The main data set ("Data") in this script is the one archived after the initial merge of the testing and training set. 
Its dimension is 10299 by 563. There are 10,299 subjects in this study, 561 attributes, 1 subject ID column and 1 Activity ID column.

In the final step a tidy data set ("Data2") is created with the average of each attribute for each activity and each subject. 10299 instances are split into 180 groups (30 subjects and 6 activities) and 86 mean and standard deviation features are averaged for each group. The resulting data table has 180 rows and 88 columns. 
