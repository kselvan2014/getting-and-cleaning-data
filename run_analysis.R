######
## In order for this script to work properly, the zip file that contains
## the dataset has to be extrated in the current working directory.
## Extrating the zip file creates a directory called "UCI HAR Dataset"
## in the working directory. This name and contents of this directory 
## should remain unchangd for the script to execute properly.
######

## Read test data
#### Read subject_test.txt
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
#### Read y_test.txt
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
#### Read X_test.txt
X_test <- read.table("./UCI HAR Dataset/test/X_test.txt")

## Read training data
#### Read subject_train.txt
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
#### Read y_train.txt
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
#### Read X_train.txt
X_train <- read.table("./UCI HAR Dataset/train/X_train.txt")

## Read activity lables
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")

## Row bind subject_train and subject_test: Training first and test second
subject <- rbind(subject_train, subject_test)

## Row bind y_train and y_test: Training first and test second
y <- rbind(y_train, y_test)

## Row bind X_train and X_test: Training first and test second
X <- rbind(X_train, X_test)

## Create the merged data set by column binding: subject, y and X
merged_ds <- cbind(y, subject, X)

## Read variable names for X from features.txt
features <- read.table("./UCI HAR Dataset/features.txt", colClasses=c("integer","character"))[2]

## Assign unique descriptive variable names to the merged data set
## This is needed to select subset of variables using the select function in dplyr.
colnames(merged_ds) <- c("activity_1", "subject_2", paste(features[,],3:563,sep = "_"))

## Load plyr, dplyr and tidyr packages
library(plyr)
library(dplyr)
library(tidyr)


## Convert the merged data set to a data frame tbl and select the required subset
merged_subset_tbl <- tbl_df(merged_ds) %>%
  select(one_of("activity_1","subject_2"),contains("mean"), contains("std"), -contains("angle"))

## Change activity_1 variable to show descriptive activity names
final_subset <- mutate(merged_subset_tbl,"activity_1"=
                           as.character(activity_labels$V2[
                             match(merged_subset_tbl$"activity_1",activity_labels$V1)])
                         )

## Rename the variables in the subset to match the orinal names, as in features.txt
colnames(final_subset) <- gsub("[[:digit:]]","",gsub("*_","",names(final_subset)))

## Create the second independent tidy data set with the average of 
## each variable for each activity and each subject.
tidy_ds <- final_subset %>% group_by(activity,subject) %>% summarise_each(funs(mean))

## Rename the variables in itidy_ds (except activity and subject) with the prefix "mean-of"
## so as to not to confuse with the variables names in final_subset
colnames(tidy_ds) <- c("activity", "subject", 
                        paste("mean-of",
                              names(tidy_ds)[!names(tidy_ds) %in% c("activity", "subject")],
                              sep = "-"))
## Create a text file tidy_ds.txt in the working directory
##write.table(tidy_ds,file="tidy_ds.txt",row.name=FALSE)

cat("Hello,
'final_subset' contains:
  1. Merged training and the test sets
  2. Only the measurements on the mean and standard deviation for each measurement
  3. Descriptive activity names to name the activities in the data set
  4. Appropriate labels with descriptive variable names
    
'tidy_ds' is the second, independent tidy data set with the average of each variable 
for each activity and each subject.")