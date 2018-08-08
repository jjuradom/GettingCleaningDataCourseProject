# Course Project 3

# 0. Loading the data

## First of all, I load dplyr package
library(dplyr)

## Then, I download the data from the zip file
fileurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
filezip <- "UCI HAR Dataset.zip"

if(!file.exists(filezip)){download.file(fileurl, filezip, mode = "wb")}

dataset <- "UCI HAR Dataset"
if (!file.exists(dataset)){unzip(filezip)}

## There are many folders inside, so I need to read all the data

## Activity labels
activity_labels <- read.table(file.path(dataset, "activity_labels.txt"))
colnames(activity_labels) <- c("id_activity", "name_activity")
head(activity_labels)

## Features
features <- read.table(file.path(dataset, "features.txt"),as.is = TRUE)
colnames(features) <- c("id_feature", "name_feature")
head(features)

## Train files
subject_train <- read.table(file.path(dataset,"train", "subject_train.txt"))
x_train <- read.table(file.path(dataset,"train", "X_train.txt"))
y_train <- read.table(file.path(dataset,"train", "y_train.txt"))

## Test files
subject_test <- read.table(file.path(dataset,"test","subject_test.txt"))
x_test <- read.table(file.path(dataset,"test","X_test.txt"))
y_test <- read.table(file.path(dataset,"test","y_test.txt"))


# 1. Merges the training and the test sets to create one data set.

unique_dataset <- rbind(cbind(subject_train,x_train,y_train),
                        cbind(subject_test,x_test,y_test))
colnames(unique_dataset) <- c("subject", features[,2],"activity")


# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
measurements <- grepl("subject|activity|mean|std",colnames(unique_dataset))
unique_dataset2 <- unique_dataset[,measurements]


# 3. Uses descriptive activity names to name the activities in the data set
unique_dataset2$activity <- factor(unique_dataset2$activity,levels = activity_labels[,1],
                                   labels = activity_labels[,2])


# 4. Appropriately labels the data set with descriptive variable names.

## I should remove some characters and to assign the correct names to each column. 
##So, I get the names of the colums and remove some symbols
unique_dataset2_labels <- colnames(unique_dataset2)
unique_dataset2_labels <- gsub("[\\(\\)-]", "",unique_dataset2_labels)
unique_dataset2_labels

## I clean up some names and remove abbreviations

unique_dataset2_labels <- gsub("^t", "timeDomain", unique_dataset2_labels)
unique_dataset2_labels <- gsub("mean", "Mean", unique_dataset2_labels)
unique_dataset2_labels <- gsub("std", "StandardDeviation", unique_dataset2_labels)
unique_dataset2_labels <- gsub("^f", "frequencyDomain", unique_dataset2_labels)
unique_dataset2_labels <- gsub("Acc", "Accelerometer", unique_dataset2_labels)
unique_dataset2_labels <- gsub("Gyro", "Gyroscope", unique_dataset2_labels)
unique_dataset2_labels <- gsub("Mag", "Magnitude", unique_dataset2_labels)
unique_dataset2_labels <- gsub("Freq", "Frequency", unique_dataset2_labels)
unique_dataset2_labels

## After cleaning the names, I set the names in the dataset
colnames(unique_dataset2) <- unique_dataset2_labels


# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
unique_dataset2_average <- unique_dataset2 %>% group_by(subject,activity) %>% summarise_each(funs(mean))

## Finally, I generate the data
write.table(unique_dataset2_average,"tidy_dataset.txt",row.names = FALSE, quote = FALSE)

