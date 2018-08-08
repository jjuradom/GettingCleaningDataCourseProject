# Code Book Course Project

## Introduction

In this code book, it will be explained the variables, the data and all the transformations I performed to clean up the data.

## The data

One of the most exciting areas in all of data science right now is wearable computing.ompanies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone.

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

## The variables

features <-- 'features.txt': List of all features.

activity_lables <-- 'activity_labels.txt': Links the class labels with their activity name.

subject_train <-- 'subject_train.txt': subjetct of training set

x_train <-- 'train/X_train.txt': Training set.

y_train <-- 'train/y_train.txt': Training labels.

subject_test <-- 'subject_test.txt': subjetct of test set

x_test <--- 'test/X_test.txt': Test set.

y_test <-- 'test/y_test.txt': Test labels.

## Transformations of the data

* unique_dataset: merge the training set with test set in one sigle variable. Also, I change the column names ot thes variable with subject, activity and the second column of features.

* measurements: I look for specific words (subject, activity, mean and std) and I create a new variable "unique_dataset2" with thes colums.

* unique_dataset2: I modify the columns and I assign 'activity' as a factor.

* unique_dataset2_labels: it allows me to adapt the names to show them in a clean way, removing some symbols and changing some abbreviations.

* unique_dataset2_average: it is the new tidy data set, with the avarage of each variable for each subject and activity.
