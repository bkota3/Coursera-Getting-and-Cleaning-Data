

Introduction

This  project is part of my certification course on Getting and Cleaning Data. A link to the data has been provided 
which was derived from a website that represents data collected from the accelerometers from the Samsung Galaxy S smartphone.


Raw Data

The raw data has been prepared by performing experiments on 30 volunteers wearing the smartphone on their waist. Each person performed six activities : WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 
The raw data is unlabeled. The activity labels are in the y_test.txt file. The test subjects are in the subject_test.txt file.The same holds good for the training data as well. 

Tidy Dataset

I created a R script called run_analysis.R  as per the following steps:

1. Downloaded and extracted the UCI HAR Dataset.
2. Loaded the activityLabels and features.
3. The data on mean and standard deviation has been extracted as per the requirement.
4. The datasets on Train and Test have been loaded.
5. The above datasets were merged and labelled.
6. Finally a tidy data set with the average of each variable for each activity and each subject has been created.
- [ ] 
