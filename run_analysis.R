library(reshape2)

# Loading data from files. That could take some time... 
activity_labels<-read.table("activity_labels.txt", quote="")
features<-read.table("features.txt", quote="")
subject_test<-read.table("subject_test.txt", quote="",colClasses = "character")
subject_train<-read.table("subject_train.txt", quote="",colClasses = "character")
X_test<-read.table("X_test.txt", quote="")
X_train<-read.table("X_train.txt", quote="")
y_test<-read.table("y_test.txt", quote="")
y_train<-read.table("y_train.txt", quote="")

# Adding the subject label and the activity code columns
X_test<-cbind(subject_test,y_test,X_test)
X_train<-cbind(subject_train,y_train,X_train)

# Merging the test and train sets
combined<-rbind(X_test,X_train)

# Naming the features columns according to features.txt
colnames(combined)<-c("SubjectLabel","Activity",as.character(features[,2]))

# Replacing the activity code by the activity name
combined$Activity<-activity_labels[,2][match(combined$Activity,activity_labels[,1])]

# Leaving only features that contain mean() or std()
ColsToKeep<-sort(c(1,2,grep("mean\\(\\)",features[,2])+2,grep("std\\(\\)",features[,2])+2))

combined<-combined[,ColsToKeep]

# Changing the names of the features to meaningfull ones
names(combined)<-sub('tBody','TimeBody',names(combined))
names(combined)<-sub('Acc','Acceleration',names(combined))
names(combined)<-sub('tGravity','TimeGravity',names(combined))
names(combined)<-sub('fBody','FrequencySignalBody',names(combined))
names(combined)<-sub('Mag','Magnitude',names(combined))

# Creating the final dataset
meltCombined<-melt(combined, id=1:2)
Final<-dcast(meltCombined, SubjectLabel + Activity ~ variable, mean)

# Saving it to a file
write.table(Final,"final.txt",row.names = FALSE)
