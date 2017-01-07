library(reshape2)
 filename <- "UCI HAR Dataset.zip"
         ## Download and unzip the dataset:
	if (!file.exists(filename)){
			  fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip "
 	  download.file(fileURL, filename, method="curl")
	}  
	if (!file.exists("UCI HAR Dataset")) { 
 	  unzip(filename) 
	}
	 
	  	## Load activity labels and features
	  	activityLabels <- read.table("UCI HAR Dataset/activity_labels.txt")
 	activityLabels[,2] <- as.character(activityLabels[,2])
 	features <- read.table("UCI HAR Dataset/features.txt")
	features[,2] <- as.character(features[,2])
       ## Extract only the data on mean and standard deviation
 	measurementsNeeded <- grep(".*mean.*|.*std.*", features[,2])
 	measurementsNeeded.names <- features[measurementsNeeded,2]
	measurementsNeeded.names = gsub("-mean", "Mean", measurementsNeeded.names)
 	measurementsNeeded.names = gsub("-std", "Std", measurementsNeeded.names)
 	measurementsNeeded.names <- gsub("[-()]", " ", measurementsNeeded.names)
      ## Load the datasets
 	train <- read.table("UCI HAR Dataset/train/X_train.txt")[measurementsNeeded]
	trainActivities <- read.table("UCI HAR Dataset/train/Y_train.txt")
	trainSubjects <- read.table("UCI HAR Dataset/train/subject_train.txt")
	train <- cbind(trainSubjects, trainActivities, train)
 
    test <- read.table("UCI HAR Dataset/test/X_test.txt")[measurementsNeeded]
 	testActivities <- read.table("UCI HAR Dataset/test/Y_test.txt")
 	testSubjects <- read.table("UCI HAR Dataset/test/subject_test.txt")
 	test <- cbind(testSubjects, testActivities, test)
     ## merge datasets and add labels
 	tidydata <- rbind(train, test)
 	colnames(tidydata) <- c("subject", "activity", measurementsNeeded.names)
     ## turn activities & subjects into factors
 	tidydata$activity <- factor(tidydata$activity, levels = activityLabels[,1], labels = activityLabels[,2])
 	tidydata$subject <- as.factor(tidydata$subject)
 
    tidydata.melted <- melt(tidydata, id = c("subject", "activity"))
 	tidydata.mean <- dcast(tidydata.melted, subject + activity ~ variable, mean)
 
  	 write.table(tidydata.mean, "tidy.csv", sep = ",", col.names = TRUE, row.names = FALSE, quote = FALSE)