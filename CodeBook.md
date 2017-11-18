# Code book for "Getting and Cleaning Data Course Project"

This dataset is created from the 'UCI HAR Dataset' datasets. 

Transformation steps
====================

1. Load the feature names from 'features.txt' and convert them into appropriate format for column names.
+ replace "(", ")", and "." by "_".
+ replace all blocks of several dots by one dot
+ replace final dots
2. Load data from 'test/X_test.txt' and 'train/X_test.txt' and merge (bind) the values into 'X'.
3. Load data from 'test/y_test.txt' and 'train/y_test.txt' and merge (bind) the values into 'y'.
4. Load data from 'test/subject_test.txt' and 'train/subject_test.txt' and merge (bind) the values into 'subject'.
5. Extract only the measurements on the mean and standard deviation for each measurement.
+ remove all columns fron 'X' except those which containing 'mean' and 'std' in their names.
6. Replace numerical values in 'y' by their descriptive names from 'activity_labels.txt'.
7. Create 'means_activity_subject' data set with the average of each variable for each activity and each subject.
+ merge x, y, and subject into one set, 
+ group by 'activity.name' and 'subject', 
+ sumarize with mean for all columns

Dataset files
=============

 - 'output/x.csv' - X values in comma sparated format, where every column is a variable, every row is a measurement. See the list of variables below.
 - 'output/y.csv' - y values with one filed "activity.name".
 - 'output/means_activity_subjects.csv' - comma separated dataset with the average of each variable for each activity and each subject. See the list of variables below.

Variables
=========

 - tBodyAcc.mean.X
 - tBodyAcc.mean.Y
 - tBodyAcc.mean.Z
 - tBodyAcc.std.X
 - tBodyAcc.std.Y
 - tBodyAcc.std.Z
 - tGravityAcc.mean.X
 - tGravityAcc.mean.Y
 - tGravityAcc.mean.Z
 - tGravityAcc.std.X
 - tGravityAcc.std.Y
 - tGravityAcc.std.Z
 - tBodyAccJerk.mean.X
 - tBodyAccJerk.mean.Y
 - tBodyAccJerk.mean.Z
 - tBodyAccJerk.std.X
 - tBodyAccJerk.std.Y
 - tBodyAccJerk.std.Z
 - tBodyGyro.mean.X
 - tBodyGyro.mean.Y
 - tBodyGyro.mean.Z
 - tBodyGyro.std.X
 - tBodyGyro.std.Y
 - tBodyGyro.std.Z
 - tBodyGyroJerk.mean.X
 - tBodyGyroJerk.mean.Y
 - tBodyGyroJerk.mean.Z
 - tBodyGyroJerk.std.X
 - tBodyGyroJerk.std.Y
 - tBodyGyroJerk.std.Z
 - tBodyAccMag.mean
 - tBodyAccMag.std
 - tGravityAccMag.mean
 - tGravityAccMag.std
 - tBodyAccJerkMag.mean
 - tBodyAccJerkMag.std
 - tBodyGyroMag.mean
 - tBodyGyroMag.std
 - tBodyGyroJerkMag.mean
 - tBodyGyroJerkMag.std
 - fBodyAcc.mean.X
 - fBodyAcc.mean.Y
 - fBodyAcc.mean.Z
 - fBodyAcc.std.X
 - fBodyAcc.std.Y
 - fBodyAcc.std.Z
 - fBodyAcc.meanFreq.X
 - fBodyAcc.meanFreq.Y
 - fBodyAcc.meanFreq.Z
 - fBodyAccJerk.mean.X
 - fBodyAccJerk.mean.Y
 - fBodyAccJerk.mean.Z
 - fBodyAccJerk.std.X
 - fBodyAccJerk.std.Y
 - fBodyAccJerk.std.Z
 - fBodyAccJerk.meanFreq.X
 - fBodyAccJerk.meanFreq.Y
 - fBodyAccJerk.meanFreq.Z
 - fBodyGyro.mean.X
 - fBodyGyro.mean.Y
 - fBodyGyro.mean.Z
 - fBodyGyro.std.X
 - fBodyGyro.std.Y
 - fBodyGyro.std.Z
 - fBodyGyro.meanFreq.X
 - fBodyGyro.meanFreq.Y
 - fBodyGyro.meanFreq.Z
 - fBodyAccMag.mean
 - fBodyAccMag.std
 - fBodyAccMag.meanFreq
 - fBodyBodyAccJerkMag.mean
 - fBodyBodyAccJerkMag.std
 - fBodyBodyAccJerkMag.meanFreq
 - fBodyBodyGyroMag.mean
 - fBodyBodyGyroMag.std
 - fBodyBodyGyroMag.meanFreq
 - fBodyBodyGyroJerkMag.mean
 - fBodyBodyGyroJerkMag.std
 - fBodyBodyGyroJerkMag.meanFreq

Notes: 
======
- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.
