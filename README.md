Project Requirements:

Merges the training and the test sets to create one data set.
Extracts only the measurements on the mean and standard deviation for each measurement
Uses descriptive activity names to name the activities in the data set
Appropriately label the data set with descriptive variable names. 
Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Description of the Original Data set:

features.txt : List of all features.
activity_labels.txt : Links the class labels with their activity name.
train/X_train.txt : Training set of 561-feature vector (unlabelled)
test/X_test.txt : Test set of 561-feature vector (unlabelled)
train/y_train.txt : Training labels
test/y_test.txt : Test labels
train/subject_train.txt : Trainign data that identifies the subject 
test/subject_test.txt : Test data that identifies the subject 

Steps:

1) Download and unzip the source data (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip ) in your local working R directory.This will create a UCI HAR Dataset folder.
2) Download the run_analysis.R into the UCI HAR Dataset folder.
3) Open R and make sure to set you current working directly is set to the UCI HAR Dataset folder.
4) The Rcode will look for the data.table and the plyr packages.Install these packages in R if you have not already done so.
5) Execute the following code in R
source("run_analysis.R"). 
6) This R code will generate 2 data files in you current working directory

	MergedData.txt: a merged data table containing training ,test,activity and subject data.This data set is a subset of just the mean and std related data. 

	tidydata.txt: This file is the final output which has 68 columns. It includes a column for the subject , one column for the activity and one column each for the 66 attributes.It has 180 rows of data.This data set includes only the average of each attribute for each activity and each subject.

