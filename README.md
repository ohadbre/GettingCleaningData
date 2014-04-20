##Prerequisite:

The package **reshape2** should be installed.

The following files should be placed at the same directory as this script:
* activity_labels.txt
* features.txt"
* subject_test.txt
* subject_train.txt
* X_test.txt
* X_train.txt
* y_test.txt
* y_train.txt

##What this script does

* using the cbind command, the script adds two columns to the data: an identifier for each subject as well as the label for the activity taken
* merges the train and the test sets using the rbing command
* names the features columns according to features.txt
* replaces the activity code by the corresponding activity name using activity_labels.txt
* leaves only features that contain mean() or std()
* changes the names of the features to meaningful ones
* aggregates the data for each subject and activity based on the average of each feature using melt and dcast commands
* saved the tidy data to disk
