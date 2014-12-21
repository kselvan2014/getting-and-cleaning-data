---
title: "CookBook.md"
output: html_document
---

Cook Book for "getting and cleaning data" course project
========================================================
Human Activity Recognition Using Smartphones Dataset (Version 1.0) was used to derive the final data sets as per the instructions of the "getting and cleaning data" course project.

URL for this data set is: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

This dataset contains both training and test data sets. The files that are of interest to us are:

- 'features_info.txt': Describes how the features were derived

- 'features.txt': Lists all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

- 'train/subject_train.txt' and 'train/subject_test.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.

=============================================

The data was merged as follows:

(1) The training and test subject data was merged: 'train/subject_train.txt' was merged with 'train/subject_test.txt'

(2) The training and test lables were merged: 'train/y_train.txt' was merged with 'test/y_test.txt'.

(3) The training and test dataset was merged: 'train/X_train.txt' was merged with 'test/X_test.txt'.

(4) The resulting three data sets from above were merged columnwise to create one consolidated data set.

(5) The activity lables in the consolidated data set were changed from numeric identifiers to descriptive activity names

(6) A subset of this consolidated dataset was created. This subset contains only the measurements on the mean and standard deviation for each measurement in addition to activity and subject.

The variable names of this subset called 'final_subset' are listed below:

"activity"

"subject"

"tBodyAcc-mean()-X"

"tBodyAcc-mean()-Y"

"tBodyAcc-mean()-Z"

"tGravityAcc-mean()-X"

"tGravityAcc-mean()-Y"

"tGravityAcc-mean()-Z"

"tBodyAccJerk-mean()-X"

"tBodyAccJerk-mean()-Y"

"tBodyAccJerk-mean()-Z"

"tBodyGyro-mean()-X"

"tBodyGyro-mean()-Y"

"tBodyGyro-mean()-Z"

"tBodyGyroJerk-mean()-X"

"tBodyGyroJerk-mean()-Y"

"tBodyGyroJerk-mean()-Z"

"tBodyAccMag-mean()"

"tGravityAccMag-mean()"

"tBodyAccJerkMag-mean()"

"tBodyGyroMag-mean()"

"tBodyGyroJerkMag-mean()"

"fBodyAcc-mean()-X"

"fBodyAcc-mean()-Y"

"fBodyAcc-mean()-Z"

"fBodyAcc-meanFreq()-X"

"fBodyAcc-meanFreq()-Y"

"fBodyAcc-meanFreq()-Z"

"fBodyAccJerk-mean()-X"

"fBodyAccJerk-mean()-Y"

"fBodyAccJerk-mean()-Z"

"fBodyAccJerk-meanFreq()-X"

"fBodyAccJerk-meanFreq()-Y"

"fBodyAccJerk-meanFreq()-Z"

"fBodyGyro-mean()-X"

"fBodyGyro-mean()-Y"

"fBodyGyro-mean()-Z"

"fBodyGyro-meanFreq()-X"

"fBodyGyro-meanFreq()-Y"

"fBodyGyro-meanFreq()-Z"

"fBodyAccMag-mean()"

"fBodyAccMag-meanFreq()"

"fBodyBodyAccJerkMag-mean()"

"fBodyBodyAccJerkMag-meanFreq()"

"fBodyBodyGyroMag-mean()"

"fBodyBodyGyroMag-meanFreq()"

"fBodyBodyGyroJerkMag-mean()"

"fBodyBodyGyroJerkMag-meanFreq()"

"tBodyAcc-std()-X"

"tBodyAcc-std()-Y"

"tBodyAcc-std()-Z"

"tGravityAcc-std()-X"

"tGravityAcc-std()-Y"

"tGravityAcc-std()-Z"

"tBodyAccJerk-std()-X"

"tBodyAccJerk-std()-Y"

"tBodyAccJerk-std()-Z"

"tBodyGyro-std()-X"

"tBodyGyro-std()-Y"

"tBodyGyro-std()-Z"

"tBodyGyroJerk-std()-X"

"tBodyGyroJerk-std()-Y"

"tBodyGyroJerk-std()-Z"

"tBodyAccMag-std()"

"tGravityAccMag-std()"

"tBodyAccJerkMag-std()"

"tBodyGyroMag-std()"

"tBodyGyroJerkMag-std()"

"fBodyAcc-std()-X"

"fBodyAcc-std()-Y"

"fBodyAcc-std()-Z"

"fBodyAccJerk-std()-X"

"fBodyAccJerk-std()-Y"

"fBodyAccJerk-std()-Z"

"fBodyGyro-std()-X"

"fBodyGyro-std()-Y"

"fBodyGyro-std()-Z"

"fBodyAccMag-std()"

"fBodyBodyAccJerkMag-std()"

"fBodyBodyGyroMag-std()"

"fBodyBodyGyroJerkMag-std()"

======================================

The tidy data set was created as follows:

(1) Using the 'final_subset' data set created as mentioned above, average values were calculated for each variable grouped by 'activity' and 'subject'.

(2) The variables names of the resulting data set were prefixed with "mean-of" to provide a more meaningful name and also to differentiate from the varaible names of the previous data set, namely 'final_subset'

(3) The resulting tidy data set is called 'tidy_ds'

The variable names of this tidy data set, 'tidy_ds' are listed below:

"activity"

"subject"

"mean-of-tBodyAcc-mean()-X"

"mean-of-tBodyAcc-mean()-Y"

"mean-of-tBodyAcc-mean()-Z"

"mean-of-tGravityAcc-mean()-X"

"mean-of-tGravityAcc-mean()-Y"

"mean-of-tGravityAcc-mean()-Z"

"mean-of-tBodyAccJerk-mean()-X"

"mean-of-tBodyAccJerk-mean()-Y"

"mean-of-tBodyAccJerk-mean()-Z"

"mean-of-tBodyGyro-mean()-X"

"mean-of-tBodyGyro-mean()-Y"

"mean-of-tBodyGyro-mean()-Z"

"mean-of-tBodyGyroJerk-mean()-X"

"mean-of-tBodyGyroJerk-mean()-Y"

"mean-of-tBodyGyroJerk-mean()-Z"

"mean-of-tBodyAccMag-mean()"

"mean-of-tGravityAccMag-mean()"

"mean-of-tBodyAccJerkMag-mean()"

"mean-of-tBodyGyroMag-mean()"

"mean-of-tBodyGyroJerkMag-mean()"

"mean-of-fBodyAcc-mean()-X"

"mean-of-fBodyAcc-mean()-Y"

"mean-of-fBodyAcc-mean()-Z"

"mean-of-fBodyAcc-meanFreq()-X"

"mean-of-fBodyAcc-meanFreq()-Y"

"mean-of-fBodyAcc-meanFreq()-Z"

"mean-of-fBodyAccJerk-mean()-X"

"mean-of-fBodyAccJerk-mean()-Y"

"mean-of-fBodyAccJerk-mean()-Z"

"mean-of-fBodyAccJerk-meanFreq()-X"

"mean-of-fBodyAccJerk-meanFreq()-Y"

"mean-of-fBodyAccJerk-meanFreq()-Z"

"mean-of-fBodyGyro-mean()-X"

"mean-of-fBodyGyro-mean()-Y"

"mean-of-fBodyGyro-mean()-Z"

"mean-of-fBodyGyro-meanFreq()-X"

"mean-of-fBodyGyro-meanFreq()-Y"

"mean-of-fBodyGyro-meanFreq()-Z"

"mean-of-fBodyAccMag-mean()"

"mean-of-fBodyAccMag-meanFreq()"

"mean-of-fBodyBodyAccJerkMag-mean()"

"mean-of-fBodyBodyAccJerkMag-meanFreq()"

"mean-of-fBodyBodyGyroMag-mean()"

"mean-of-fBodyBodyGyroMag-meanFreq()"

"mean-of-fBodyBodyGyroJerkMag-mean()"

"mean-of-fBodyBodyGyroJerkMag-meanFreq()"

"mean-of-tBodyAcc-std()-X"

"mean-of-tBodyAcc-std()-Y"

"mean-of-tBodyAcc-std()-Z"

"mean-of-tGravityAcc-std()-X"

"mean-of-tGravityAcc-std()-Y"

"mean-of-tGravityAcc-std()-Z"

"mean-of-tBodyAccJerk-std()-X"

"mean-of-tBodyAccJerk-std()-Y"

"mean-of-tBodyAccJerk-std()-Z"

"mean-of-tBodyGyro-std()-X"

"mean-of-tBodyGyro-std()-Y"

"mean-of-tBodyGyro-std()-Z"

"mean-of-tBodyGyroJerk-std()-X"

"mean-of-tBodyGyroJerk-std()-Y"

"mean-of-tBodyGyroJerk-std()-Z"

"mean-of-tBodyAccMag-std()"

"mean-of-tGravityAccMag-std()"

"mean-of-tBodyAccJerkMag-std()"

"mean-of-tBodyGyroMag-std()"

"mean-of-tBodyGyroJerkMag-std()"

"mean-of-fBodyAcc-std()-X"

"mean-of-fBodyAcc-std()-Y"

"mean-of-fBodyAcc-std()-Z"

"mean-of-fBodyAccJerk-std()-X"

"mean-of-fBodyAccJerk-std()-Y"

"mean-of-fBodyAccJerk-std()-Z"

"mean-of-fBodyGyro-std()-X"

"mean-of-fBodyGyro-std()-Y"

"mean-of-fBodyGyro-std()-Z"

"mean-of-fBodyAccMag-std()"

"mean-of-fBodyBodyAccJerkMag-std()"

"mean-of-fBodyBodyGyroMag-std()"

"mean-of-fBodyBodyGyroJerkMag-std()"
