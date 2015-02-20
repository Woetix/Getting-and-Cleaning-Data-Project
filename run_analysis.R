################################################################################
##   Getting and Cleaning Data Course Project
##   February 20, 2015
################################################################################


## Download the training and test data sets and unzip
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, destfile = "Dataset.zip" , method = "curl")
unzip("Dataset.zip")


## Importing  the data sets
xtrain<-read.table("./UCI HAR Dataset/train/X_train.txt")
xtest<-read.table("./UCI HAR Dataset/test/X_test.txt")
ytrain<-read.table("./UCI HAR Dataset/train/y_train.txt")
ytest<-read.table("./UCI HAR Dataset/test/y_test.txt")
subjecttrain<-read.table("./UCI HAR Dataset/train/subject_train.txt")
subjecttest<-read.table("./UCI HAR Dataset/test/subject_test.txt")
activitylabels<-read.table("./UCI HAR Dataset/activity_labels.txt")
features<-read.table("./UCI HAR Dataset/features.txt")


## Merges the training and the test sets to create one data set for X 
xdata<-rbind(xtrain,xtest)


## Extracts only the measurements on the mean and standard deviation
colnames(xdata) <- c(as.character(features[,2]))
mean<-grep("mean()",colnames(xdata),fixed=TRUE)
stdev<-grep("std()",colnames(xdata),fixed=TRUE)
meanstdev<-xdata[,c(mean,stdev)]

## Combine the activity data with the dataset of means and standard deviations
ydata<-rbind(ytrain,ytest)
activitydata<-cbind(ydata,meanstdev)


## Appropriately labels the data set with descriptive activity names.

colnames(activitydata)[1] <- "Activity"

## Uses descriptive activity names to name the activities in the data set
activitylabels[,2]<-as.character(activitylabels[,2])
for(i in 1:length(activitydata[,1])){
        activitydata[i,1]<-activitylabels[activitydata[i,1],2]
}
## Creates a second, independent tidy data set with the average of each variable for each activity and each subject
subjectdata<-rbind(subjecttrain,subjecttest)
alldata<-cbind(subjectdata,activitydata)
colnames(alldata)[1] <- "Subject"
tidydata <- aggregate( alldata[,3] ~ Subject+Activity, data = alldata, FUN = "mean" )
for(i in 4:ncol(alldata)){
        tidydata[,i] <- aggregate( alldata[,i] ~ Subject+Activity, data = alldata, FUN = "mean" )[,3]
}
colnames(tidydata)[3:ncol(tidydata)] <- colnames(meanstdev)
write.table(tidydata, file = "tidydata.txt",row.name=FALSE)
