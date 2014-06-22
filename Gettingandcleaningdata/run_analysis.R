# Assumptions: all the data required to run this code are in the current working directory
# This code requires the data.table and plyr packages to be installed prior to running this code
# run_analysis.R will be located in the same location as UCI HAR Dataset
# The final output is stored in a text file(tidydata.txt) in the current working directory 

require("plyr")

#1. The first steps combines the corresponding test and training data sets to create one combined data set

	#1a. Merge the test and train data sets for X

		trainx <- read.table("train/X_train.txt")
		testx <- read.table("test/X_test.txt")
		AllX <- rbind(trainx, testx)

	#1b. Merge the test and train data sets for subject

		subtrain <- read.table("train/subject_train.txt")
		subtest <- read.table("test/subject_test.txt")
		AllSub <- rbind(subtrain, subtest)

	#1c. Merge the test and train data sets for Y

		trainy <- read.table("train/y_train.txt")
		testy <- read.table("test/y_test.txt")
		AllY <- rbind(trainy, testy)

# 2. Extracts only the measurements on the mean and standard deviation for each measurement

	#2a.Read the feature list file and get only the features data that we want

		features <- read.table("features.txt")
		requiredfeatures <- grep("-mean\\(\\)|-std\\(\\)", features[, 2])

	#2b.Extract only the measurements on the mean and standard deviation 		

		AllX <- AllX[, requiredfeatures]
		names(AllX) <- features[requiredfeatures, 2]
		names(AllX) <- gsub("\\(|\\)", "", names(AllX))
		names(AllX) <- tolower(names(AllX))  

# 3. Uses descriptive activity names to name the activities in the data set

		activity <- read.table("activity_labels.txt")
		activity[, 2] = gsub("_", "", tolower(as.character(activity[, 2])))	
		AllY[,1] = activity[AllY[,1], 2]
		names(AllY) <- "Activity"

# 4. Appropriately labels the data set with descriptive activity names.

		names(AllSub) <- "Subject"
	#4a. Bind data. Merge Test,Train and Subject data

		cleaneddata <- cbind(AllSub, AllY, AllX)
	#4b. Store the merged cleansed data in a file
		write.table(cleaneddata, "MergedData.txt")




# 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

		tidydataset = function(cleanseddf) {
    						tidy <- ddply(cleanseddf, .(Subject, Activity), function(x) colMeans(x[,3:68]))
    						tidy
					           }

		tidydata <- tidydataset(cleaneddata)

	#5a final data set with the average of each variable for each activity and each subject
		
		write.table(tidydata, "tidydata.txt")

#6. Testing the tidydata file

# result1 <- read.table("tidydata.txt")
# mean(result1$fbodyaccmag.std[result1$Subject==1])