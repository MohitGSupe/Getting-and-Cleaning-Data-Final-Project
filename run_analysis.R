# Getting & Cleaning Data - Final Course Project

#Loading packages
library(dplyr)
library(tidyr)

# Setting up my working directory
## Have purposely removed the complete path as it includes folders from my personal machine.
setwd("/Getting & Cleaning Data/Project/")

# Reading training data set and saving in the objects

xtrain_data <- read.table("UCI HAR Dataset/train/X_train.txt")
#View(xtrain_data)

ytrain_data <- read.table("UCI HAR Dataset/train/Y_train.txt")

subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")
feature_data <- read.table("UCI HAR Dataset/features.txt")
View(feature_data)

# Reading the test data set and saving in the objects.

xtest_data <- read.table("UCI HAR Dataset/test/X_test.txt")
#View(xtrain_data)

ytest_data <- read.table("UCI HAR Dataset/test/Y_test.txt")
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")


# Objective 1: Merges the training and the test sets to create one data set.

xdata <- rbind(xtrain_data, xtest_data)
ydata <- rbind(ytrain_data, ytest_data)
subjectdata <- rbind(subject_train, subject_test)

View(xdata)
View(ydata)
View(subjectdata)

# Objective 2: Extracts only the measurements on the mean and standard deviation for each measurement.

mean_std_em <- grep("-(mean|std)\\(\\)", feature_data[, 2])
xdata <- xdata[, mean_std_em]
names(xdata) <- feature_data[mean_std_em,2]
#View(xdata) <- Final result data

# Objective 3: Uses descriptive activity names to name the activities in the data set

activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")
#View(activity_labels)

ydata[,1] <- activity_labels[ydata[,1],2]

View(ydata)

# Objective 4: Appropriately labels the data set with descriptive variable names.

names(ydata) <- c("Activity")
names(subjectdata) <- c("Subject")

# Objective 5: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

#Combining all datasets

complete_data <- cbind(xdata, ydata, subjectdata)
head(complete_data)
tail(complete_data)
names(complete_data)

tidy_data <- aggregate(. ~ Subject + Activity, complete_data, mean)
tidy_data <- tidy_data[order(tidy_data$Subject, tidy_data$Activity),]
write.table(tidy_data, row.names = FALSE, file = "tidy.txt")
