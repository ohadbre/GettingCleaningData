## Introduction

The goal of this project is to prepare tidy data that can be used for later analysis.

As mentioned on the description of the experiment (http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones):
"The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. "

The database was downloaded from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip on April the 5th, 2014.

This is a description of the different features of the full dataset, as mentioned on **features_info.txt**:

"The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions."

Only files that were directly placed in **train** and **data** folders were used for this assignment.

As per the project instruction, I extracted only the measurements on the mean and standard deviation for each measurement, by keeping only features that contained std() or mean() in their names.

In order to make the names of the the features more self-explanatory, after studying the meaning of the names (using the **features_info.txt**) I made the following substitutions in the names of the features:

* 'tBody' became'TimeBody'
* 'Acc' became'Acceleration'
* 'tGravity' became 'TimeGravity'
* 'fBody' became'FrequencySignalBody'
* 'Mag' became'Magnitude'

So here is the final list of the features in my dataset:

* TimeBodyAcceleration-mean()-X
* TimeBodyAcceleration-mean()-Y
* TimeBodyAcceleration-mean()-Z
* TimeBodyAcceleration-std()-X
* TimeBodyAcceleration-std()-Y
* TimeBodyAcceleration-std()-Z
* TimeGravityAcceleration-mean()-X
* TimeGravityAcceleration-mean()-Y
* TimeGravityAcceleration-mean()-Z
* TimeGravityAcceleration-std()-X
* TimeGravityAcceleration-std()-Y
* TimeGravityAcceleration-std()-Z
* TimeBodyAccelerationJerk-mean()-X
* TimeBodyAccelerationJerk-mean()-Y
* TimeBodyAccelerationJerk-mean()-Z
* TimeBodyAccelerationJerk-std()-X
* TimeBodyAccelerationJerk-std()-Y
* TimeBodyAccelerationJerk-std()-Z
* TimeBodyGyro-mean()-X
* TimeBodyGyro-mean()-Y
* TimeBodyGyro-mean()-Z
* TimeBodyGyro-std()-X
* TimeBodyGyro-std()-Y
* TimeBodyGyro-std()-Z
* TimeBodyGyroJerk-mean()-X
* TimeBodyGyroJerk-mean()-Y
* TimeBodyGyroJerk-mean()-Z
* TimeBodyGyroJerk-std()-X
* TimeBodyGyroJerk-std()-Y
* TimeBodyGyroJerk-std()-Z
* TimeBodyAccelerationMagnitude-mean()
* TimeBodyAccelerationMagnitude-std()
* TimeGravityAccelerationMagnitude-mean()
* TimeGravityAccelerationMagnitude-std()
* TimeBodyAccelerationJerkMagnitude-mean()
* TimeBodyAccelerationJerkMagnitude-std()
* TimeBodyGyroMagnitude-mean()
* TimeBodyGyroMagnitude-std()
* TimeBodyGyroJerkMagnitude-mean()
* TimeBodyGyroJerkMagnitude-std()
* FrequencySignalBodyAcceleration-mean()-X
* FrequencySignalBodyAcceleration-mean()-Y
* FrequencySignalBodyAcceleration-mean()-Z
* FrequencySignalBodyAcceleration-std()-X
* FrequencySignalBodyAcceleration-std()-Y
* FrequencySignalBodyAcceleration-std()-Z
* FrequencySignalBodyAccelerationJerk-mean()-X
* FrequencySignalBodyAccelerationJerk-mean()-Y
* FrequencySignalBodyAccelerationJerk-mean()-Z
* FrequencySignalBodyAccelerationJerk-std()-X
* FrequencySignalBodyAccelerationJerk-std()-Y
* FrequencySignalBodyAccelerationJerk-std()-Z
* FrequencySignalBodyGyro-mean()-X
* FrequencySignalBodyGyro-mean()-Y
* FrequencySignalBodyGyro-mean()-Z
* FrequencySignalBodyGyro-std()-X
* FrequencySignalBodyGyro-std()-Y
* FrequencySignalBodyGyro-std()-Z
* FrequencySignalBodyAccelerationMagnitude-mean()
* FrequencySignalBodyAccelerationMagnitude-std()
* FrequencySignalBodyBodyAccelerationJerkMagnitude-mean()
* FrequencySignalBodyBodyAccelerationJerkMagnitude-std()
* FrequencySignalBodyBodyGyroMagnitude-mean()
* FrequencySignalBodyBodyGyroMagnitude-std()
* FrequencySignalBodyBodyGyroJerkMagnitude-mean()
* FrequencySignalBodyBodyGyroJerkMagnitude-std()

As the last step of the project, I aggregated the data for each subject and activity based on the average of each feature.



##Prerequisite:

The package **reshape2** should be installed.

The following files should be placed at the same directory as this script:
* activity_labels.txt
* features.txt
* subject_test.txt
* subject_train.txt
* X_test.txt
* X_train.txt
* y_test.txt
* y_train.txt

##What this script does

* using the **cbind** command, the script adds two columns to the data: an identifier for each subject as well as the label for the activity taken
* merges the train and the test sets using the **rbind** command
* names the features columns according to **features.txt**
* replaces the activity code by the corresponding activity name using **activity_labels.txt**
* leaves only features that contain mean() or std()
* changes the names of the features to meaningful ones
* aggregates the data for each subject and activity based on the average of each feature using **melt** and **dcast** commands
* saves the tidy data to disk
