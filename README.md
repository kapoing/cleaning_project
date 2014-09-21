#Cleaning Project
================
#Instructions
The run_analysis does not receive any inputs, but assume that the workspace has a folder named
UCI HAR Dataset, which has the same structure has the one available at
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

#Cleaning data walkthrough
The step performed by run_analysis are as follows:
* Read features and activities labels into data frames
* First for "test" data and then for "train" data:
  * read y values to tbl with "activity" as column name
  * read x values to tbl with features as column names
  * read subject values to tbl with Subject as column name
  * concatenate the 3 tbl into one with Subject, activity, [all the features]
* Bind test and train data by rows
* Select subset of columns into new tbl: Subject, activity, [all the features than contain in its' name "mean()" or "std()"]
* Group new tbl by Subject and activity
* Summarise_each of variables with the mean function (except the grouping variables, Subject and activity)