# Getting-and-Cleaning-Data-Course-Project
This Project is submitted for the partial fulfillment of the course Getting and Cleaning Data Course. 
The purpose of this project is to demonstrate the ability to collect, work with, and clean a data set. 
The goal is to prepare tidy data that can be used for later analysis.

## Instructions
1.) Read training and test dataset into R environment. Read variable names into R envrionment. Read subject index into R environment.

2.) Merges the training and the test sets to create one data set. Use command rbind to combine training and test set

3.) Extracts only the measurements on the mean and standard deviation for each measurement. Use grep command to get column indexes for variable name contains "mean()" or "std()"

4.) Uses descriptive activity names to name the activities in the data set Convert activity labels to characters and add a new column as factor

5.) Appropriately labels the data set with descriptive variable names. Give the selected descriptive names to variable columns

6.) From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject. Use pipeline command to create a new tidy dataset with command group_by and summarize_each in dplyr package

## The files in this repo:
1.) CodeBook.md <- Indicates all the variables and summaries calculated, along with units, in tidydataset.txt

2.) tidydataset.txt <- the tidy data set. The output of run_analysis.R

3.) run_analysis.R <- The R script that does the instructions above
