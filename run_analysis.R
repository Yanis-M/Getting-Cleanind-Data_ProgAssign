# Merges the training and the test sets to create one data set
trainData <- read.table("./UCI_HAR_Dataset/train/X_train.txt") 
trainLabel <- read.table("./UCI_HAR_Dataset/train/y_train.txt") 
trainSubject <- read.table("./UCI_HAR_Dataset/train/subject_train.txt") 
testData <- read.table("./UCI_HAR_Dataset/test/X_test.txt") 
testLabel <- read.table("./UCI_HAR_Dataset/test/y_test.txt")  
testSubject <- read.table("./UCI_HAR_Dataset/test/subject_test.txt") 
joinData <- rbind(trainData, testData) 
joinLabel <- rbind(trainLabel, testLabel) 
joinSubject <- rbind(trainSubject, testSubject) 

# Extracting only the measurements on the mean and standard deviation for each measurement.  
features <- read.table("./UCI_HAR_Dataset/features.txt") 
OnlyMSd <- grep("mean\\(\\)|std\\(\\)", features[, 2]) 
joinData <- joinData[, OnlyMSd] 

# Using descriptive activity names to name the activities in the data set 
activity <- read.table("./UCI_HAR_Dataset/activity_labels.txt") 
activity[, 2] <- tolower(gsub("_", "", activity[, 2])) 
substr(activity[2, 2], 8, 8) <- toupper(substr(activity[2, 2], 8, 8)) 
substr(activity[3, 2], 8, 8) <- toupper(substr(activity[3, 2], 8, 8)) 
activityLabel <- activity[joinLabel[, 1], 2] 
joinLabel[, 1] <- activityLabel 
names(joinLabel) <- "activity" 
 

# labeling the data set with descriptive activity names.  
names(joinSubject) <- "subject" 
MyData <- cbind(joinSubject, joinLabel, joinData) 
write.table(MyData, "data-firstSet.txt")

# Creating a second, independent tidy data set with the average of each variable for each activity and each subject.  
subjectLength <- length(table(joinSubject))
activityLength <- dim(activity)[1]
columnLength <- dim(MyData)[2] 
result <- matrix(NA, nrow=subjectLength*activityLength, ncol=columnLength)  
result <- as.data.frame(result) 
colnames(result) <- colnames(MyData) 
row <- 1 
for(i in 1:subjectLength) { 
             for(j in 1:activityLength) { 
                         result[row, 1] <- sort(unique(joinSubject)[, 1])[i] 
                         result[row, 2] <- activity[j, 2] 
                         bool1 <- i == MyData$subject 
                         bool2 <- activity[j, 2] == MyData$activity 
                         result[row, 3:columnLength] <- colMeans(MyData[bool1&bool2, 3:columnLength]) 
                         row <- row + 1 
                     } 
         } 
write.table(result, "data_average.txt", row.names = FALSE)
