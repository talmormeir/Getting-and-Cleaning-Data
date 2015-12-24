
##Introduction
The script run_analysis.R downloads the data from UCI Machine Learning Repository. Data can be found at: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

This analysis makes use of 6 (3 for training + 3 for testing) datasets:
###Activity - 6 types of physical activities 
###Subject - identification of the subjects in the study
###Feature - measurement values of the attributes used for modeling
  
The script merges the training and test sets to create one data set; replaces activity values in the dataset with descriptive activity names; extracts mean and stdv attributes; labels the columns with descriptive names; and creates a second, independent tidy dataset with an average of each feature for each each activity and each subject (txt file included in this repository). 

##Data Dimensions
If the data is not already available in the data directory, it is downloaded from UCI repository.

The first step of the preprocessing is to merge the training and test sets. Two sets combined, there are 10,299 instances where each instance contains 561 features (560 measurements and subject identifier). After the merge operation the resulting data, the table contains 562 columns (560 measurements, subject identifier and activity label).

After the merge operation, mean and standard deviation features are extracted for further processing. Out of 560 measurement features, 33 mean and 33 standard deviations features are extracted, yielding a data frame with 68 features (additional two features are subject identifier and activity label).

Next, the activity labels are replaced with descriptive activity names, defined in activity_labels.txt in the original data folder.

The final step creates a tidy data set with the average of each variable for each activity and each subject. 10299 instances are split into 180 groups (30 subjects and 6 activities) and 66 mean and standard deviation features are averaged for each group. The resulting data table has 180 rows and 66 columns. The tidy data set is exported to UCI_HAR_tidy.csv where the first row is the header containing the names for each column.
