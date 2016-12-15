# Assignment for "Getting and Cleaning data" (as copied from the coursera page):
# You should create one R script called run_analysis.R that does the following. 
# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names.
# 5. From the data set in step 4, creates a second, independent tidy data set with the 
#    average of each variable for each activity and each subject.

# This assignment is based on the following data:
# "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

# For fulfilling the tasks, I got some inspiration here:
# https://thoughtfulbloke.wordpress.com/2015/09/09/getting-and-cleaning-the-assignment/

# For information on the variables for which summaries are calculated see the CodeBook.md.
# For information on the original variables see the file "features_info.txt" in the zip-file
# "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

# General information can also be found in the README.md

# In the following you will find sections for each step of the assignment with comments and
# explanations to it. Please note that there is no code for step 4 since I already included
# it in step 1.

# load library used in run_analysis.R
library(dplyr)

# In addition to the steps mentioned above, I also included the getting of the data in this script
# Get the data: Download the zip-file and unzip
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", "UCIHARDataset.zip")
unzip("UCIHARDataset.zip")

##############################################################################################
# Step 1 from the instruction: Merge the training and the test sets to create one data set. 
#  1.1: read and combine necessary information for training data (incl. subject and activity
#        as well as variable names from "UCI HAR Dataset/features.txt") in one data frame train

# read in column names
colnames_data <- read.table("UCI HAR Dataset/features.txt", check.names=FALSE)
# the column names contain unallowed characters. "-" is replaced by "_", "()" is deleted,
# single"(" and single ")" are replaced by "."
colnames_corrected <- gsub("-", "_", colnames_data[,2]) 
colnames_corrected <- gsub("\\(\\)", "", colnames_corrected) 
colnames_corrected <- gsub("\\(", ".", colnames_corrected) 
colnames_corrected <- gsub("\\)", ".", colnames_corrected) 

# read in data now and label the columns correctly
train_data <- read.table("UCI HAR Dataset/train/X_train.txt", col.names = colnames_corrected)
train_subject <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "subject")
train_activity <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = "activity")
train <- cbind(train_subject, train_activity, train_data)

#  1.2: as step 1.1 but for test data, resulting data frame is test
#       Note: the column names are necessary because rbind (next step) matches columns by name,
#       column names are the same as above and are already corrected so they can be used directly
test_data <- read.table("UCI HAR Dataset/test/X_test.txt", col.names = colnames_corrected)
test_subject <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "subject")
test_activity <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = "activity")
test <- cbind(test_subject, test_activity, test_data)

#  1.3: merge train and test data to create one data set
#       since the test data set "only" needs to be appended to the training data, rbind is used
data <- rbind(train, test)

##############################################################################################
# Step 2 from the instruction: 
#       Extract only the measurements on the mean and standard deviation for each measurement
# A new data frame slimdata is created that only contains the subject, the activity and all the 
# variables with "Mean", mean" or "std" in its name, since it is not closer specified in the 
# instruction.
slimdata <- data[,c(1,2,grep("[Mm]ean|std",names(data)))]

##############################################################################################
# Step 3 from the instruction: 
#       Use descriptive activity names to name the activities in the data set
# The activity labels are taken from "UCI HAR Dataset/activity_labels.txt"
slimdata$activity <- sub("1", "WALKING", slimdata$activity)
slimdata$activity <- sub("2", "WALKING_UPSTAIRS", slimdata$activity)
slimdata$activity <- sub("3", "WALKING_DOWNSTAIRS", slimdata$activity)
slimdata$activity <- sub("4", "SITTING", slimdata$activity)
slimdata$activity <- sub("5", "STANDING", slimdata$activity)
slimdata$activity <- sub("6", "LAYING", slimdata$activity)

##############################################################################################
# Step 4 from the instruction: 
#       Appropriately label the data set with descriptive variable names.

# The variable names were already set in step 1.1/1.2
# To me they seem to be descriptive for people knowing the topic. For more information on 
# the variables see the file "features_info.txt" in the original zip-file
# "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

##############################################################################################
# Step 5 from the instruction: 
#       From the data set in step 4, create a second, independent tidy data set with the 
#       average of each variable for each activity and each subject.
# The resulting data set is called mean_by_subject_activity
# For information on the variables see CodeBook.md

#  5.1: convert slimdata to tbl_df and group it by subject and activity in order to perform
#  necessary summarizing
by_subject_activity <- group_by(tbl_df(slimdata), subject, activity)

#  5.2: calculate the mean of all variables (except subject and activity)
mean_by_subject_activity <- summarize_all(by_subject_activity, mean)

# mean_by_subject_activity now contains the independent data tidy data set that was asked
# for in the assignment. Writing the txt file to upload to coursera:
write.table(mean_by_subject_activity, file="data_set_means.txt", row.names = FALSE)

# Note: according to the hints on 
# https://thoughtfulbloke.wordpress.com/2015/09/09/getting-and-cleaning-the-assignment/
# the resulting table is allowed to be in wide or in narrow form. I used the narrow form
# (a column that contains the activities), so that there are 6 rows for each subject.
# This way there are more rows but I save a lot of columns. The page above clearly says
# that the wide as well as the narrow form are both tidy.
# For me really intuitive information on wide/narrow form can also be found here:
# https://en.wikipedia.org/wiki/Wide_and_narrow_data
