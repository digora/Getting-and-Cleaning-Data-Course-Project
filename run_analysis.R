library(reshape2)

fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileURL, destfile = "C:\\Users\\10012230\\Documents\\Work\\wcmeasurements.zip", method = "curl")

unzip("C:\\Users\\10012230\\Documents\\Work\\wcmeasurements.zip")

activitylabels <- read.table("UCI HAR Dataset\\activity_labels.txt")
features <- read.table("UCI HAR Dataset\\features.txt")

subjecttrain <- read.table("UCI HAR Dataset\\train\\subject_train.txt")
xtrain <- read.table("UCI HAR Dataset\\train\\X_train.txt")
ytrain <- read.table("UCI HAR Dataset\\train\\y_train.txt")

subjecttest <- read.table("UCI HAR Dataset\\test\\subject_test.txt")
xtest <- read.table("UCI HAR Dataset\\test\\X_test.txt")
ytest <- read.table("UCI HAR Dataset\\test\\y_test.txt")

names(xtrain) <- features$V2 
names(xtest) <- features$V2

names(subjecttrain) <- "subjectID"
names(subjecttest) <- "subjectID"

altrain <- merge(ytrain, activitylabels, by.x = "V1", by.y = "V1")
altest <- merge(ytest, activitylabels, by.x = "V1", by.y = "V1")

names(altrain) <- c("activityID", "activity")
names(altest) <- c("activityID", "activity")

traindata <- cbind(subjecttrain, altrain, xtrain)
testdata <- cbind(subjecttest, altest, xtest)

merged <- rbind(traindata, testdata)

msnames <- grep("mean\\()|std\\()|subjectID|^activity$", names(merged))
tidy <- merged[, msnames]

melted <- melt(tidy, id=c("subjectID","activity"))
finaldf <- dcast(melted, subjectID+activity ~ variable, mean)

write.csv(finaldf, "tidydataset.csv", row.names=FALSE) 

















