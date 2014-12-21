getting-and-cleaning-data
=========================
This repository contains the following files for the "getting and cleaning data" course project:

(1) README.md (This file)
(2) run_analysis.R: The source code used for deriving the tidy data for the project
(3) CodeBook.md: Describes the variables, the data, and any transformations or work that was performed to clean up the data.

The raw data was donloaded from: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The run_analysis.R script works as follows:
===========================================
In order for this script to work properly, the zip file that contains the dataset has to be extrated in the current working directory.Extrating the zip file creates a directory called "UCI HAR Dataset"in the working directory. This name and contents of this directory should remain unchangd for the script to execute properly.

Steps:
======
(1) Read the following test data into seperate data frames
Read subject_test.txt into subject_test
Read y_test.txt into y_test
Read X_test.txt into X_test

(2) Read training data
Read subject_train.txt into subject_train
Read y_train.txt into y_train
Read X_train.txt into X_train

(3) Read activity lables
Read activity_labels.txt into activity_labels

(4) Row bind subject_train and subject_test into one data frame called 'subject': Training first and test second.

(5) Row bind y_train and y_test into one data frame called 'y': Training first and test second

(6) Row bind X_train and X_test into one data frame called 'X': Training first and test second

(7) Create a merged data set in data frame 'merged_ds' by column binding: subject, y and X

(8) Read variable names from features.txt into a dataframe called 'features'

(9) Generate and assign unique descriptive variable names to the merged data set in data frame 'merged_ds'. This is done by suffixing the values in 'features' data frame with a number sequence.

(10) Load plyr, dplyr and tidyr packages

(11) Convert the merged data set 'merged_ds' to a data frame tbl and select only the variables that contain the following measurements:
(a) Activity
(b) Subject
(c) Mean
(d) Standard deviation

(12) Change the values of activity measurements to show descriptive activity names

(13) Rename the variables in the resulting subset dataframe tbl called 'final_subset' to match the orinal names, as in features.txt. This is done by removing the number prefixes we added in 'Step 9' to provide unique variable names for the select function in 'Step 11'

Note: final_subset is the resuting data set.

(14) Create the second independent tidy data set called 'tidy_ds' that contains the average of each variable for each activity and each subject.

(15) Rename the variables in tidy_ds (except activity and subject) with the prefix "mean-of" in order to give a more meaningful name and also not to confuse with the variables names in 'final_subset' dataframe tbl.

(16) Displays the following in the end of the execution of the script:

"Hello,

'final_subset' contains:

  1. Merged training and the test sets
  
  2. Only the measurements on the mean and standard deviation for each measurement
  
  3. Descriptive activity names to name the activities in the data set
  
  4. Appropriate labels with descriptive variable names
    
'tidy_ds' is the second, independent tidy data set with the average of each variable 
for each activity and each subject."



