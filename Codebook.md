Project Outline


Download and extract the data from  https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.
Merge the training and the test sets to create one data set.
Extract the mean and standard deviation for each measurement.
Use activity names to name the activities in the data set.
Label the data set with descriptive variable names.
Create a tidy data set with the average of each variable for each activity and each subject.
The final data set is a text file that has one line per activity per subject (30 subjects * 6 activities=180 lines).


Description of the Original Data set:

The data sets are split as test (30% data) and training (70% data) data sets.

features.txt : Features List.
activity_labels.txt : Activity name.
train/X_train.txt : Training set of 561-feature vector. These are measurements from the accelerometer and gyroscope.
test/X_test.txt : Test set of 561-feature vector.These are measurements from the accelerometer and gyroscope.
train/y_train.txt : Training labels
test/y_test.txt : Test labels
train/subject_train.txt : Training data that identifies the subject 
test/subject_test.txt : Test data that identifies the subject 

Assumption

The R code requires all the data and the R script to be located in the current working directory.Also this code requires  
the "data.table" and the "plyr" packages to be installed before executing the “run_analysis.R” code.All the output text files  will also be created in the current working directory.


Process

The first step combines the corresponding test and training data sets into one data set. After this step, a subset of the  
mean and standard deviation data is extracted (66 attrributes out of the total) along with descriptive activity names and  
feature names.This subset is stored in an outputfile "MergeData.txt".We then create a tiday data set  with the average of  
each variable for each activity and each subject.Since there are 30 subjects with 6 activities the final output file has 180 rows (30*6) along with the average for each numeric attribute(66).Thus the resulting final data table has 180 rows,66 numeric attribute , 1 attribute for the subject identification and 1 attribute for the activity name. The resulting data table is 180*68. This data is stored in the "tidydata.txt" file in the current working directory.
