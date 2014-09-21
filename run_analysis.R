## The run_analysis does not receive any inputs, but assume that the workspace has a folder named
## UCI HAR Dataset, which has the same structure has the one available at
## https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
run_analysis <- function() {
  library(dplyr)
  features <- tbl_df(read.csv(file = "UCI HAR Dataset/features.txt",header=FALSE, sep=" ",col.names=c("feature","name")))
  activities <- tbl_df(read.csv(file = "UCI HAR Dataset/activity_labels.txt",header=FALSE, sep=" ",col.names=c("activity","name")))
  y_test <- tbl_df(read.csv(file = "UCI HAR Dataset/test/y_test.txt",header=FALSE, sep=" ",col.names=("activity"))) %>% mutate(activity=activities[activity,2])
  
  x_test <- tbl_df(read.csv(file = "UCI HAR Dataset/test/x_test.txt",header=FALSE, sep="",col.names=features[,2]))
  subject_test <- tbl_df(read.csv(file = "UCI HAR Dataset/test/subject_test.txt",header=FALSE, sep="",col.names=c("Subject")))
  test<-tbl_df(cbind(subject_test, y_test, x_test))
  
  y_train <- tbl_df(read.csv(file = "UCI HAR Dataset/train/y_train.txt",header=FALSE, sep=" ",col.names=("activity"))) %>% mutate(activity=activities[activity,2])
  
  x_train <- tbl_df(read.csv(file = "UCI HAR Dataset/train/x_train.txt",header=FALSE, sep="",col.names=features[,2]))
  subject_train <- tbl_df(read.csv(file = "UCI HAR Dataset/train/subject_train.txt",header=FALSE, sep="",col.names=c("Subject")))
  train<-tbl_df(cbind(subject_train, y_train, x_train))
  whole.set<-tbl_df(rbind(test,train))
  whole_sub<-select(whole,Subject, activity, contains("mean()"), contains("std()"))
  whole_sub<-group_by(whole_sub, Subject, activity)
  whole_sub_summ <- summarise_each(whole_sub,funs(mean))
  
}



