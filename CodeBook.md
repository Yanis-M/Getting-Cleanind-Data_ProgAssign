##Getting & Cleaning Data - CodeBook

This is how to obtain the tidy data with a description of the variables 

* Download the raw data from : https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

* The run_analysis.R used will do the following :

1/ Creates *trainData*, *trainLabel* and *trainSubject* variables by readind train.txt, y_train.txt, subject_train.txt respectively from the "./UCI_HAR_Dataset/train" folder
      
2/ Creates *testData*, *testLabel* and *testsubject* variables by reading X_test.txt, y_test.txt and subject_test.txt respectively from the "./UCI_HAR_Dataset/test" folder
  
3/ Concatenates by row *testData* and *trainData* to create the *joinData* data frame; concatenates by row *testLabel* and *trainLabel* to create the *joinLabel* data frame; concatenates by row *testSubject* and *trainSubject* to creta the *joinSubject* data frame.
  
4/ Creates the variable *features* by reading the features.txt file from the "./UCI_HAR_Dataset" folder. Then, extracts the mean and standard deviation only from *features* and name the created variable *OnlyMSd*. Then subsets *joinData* with the "OnlyMSd" variable.  
   
5/ Creates the data frame *activity* by reading the activity_labels.txt file from the "./UCI_HAR_Dataset" folder.
 
6/ Cleans the *activity* names in the second column of *activity* by putting all names to lower cases and removing underscores between letters then capitalizing the letter after the removed underscore. Names the column "activity".
  
7/ Transforms the values of *joinLabel* using the *activity* data frame. 
 
8/ Concatenates by column the *joinSubject*, *joinLabel* and *joinData* to obtain *MyData* data frame. Names the first column "subject". 
 
9/ Writes the *Mydata* out to "data-firstSet.txt" file. 
 
10/generates the tidy data set with the average of each measurement for each activity and each subject. For each combination subject-activity the corresponding mean is calculated. The data frame *result* is initialized with a number of columns equal to that of *MyData* and a number of rows equal to the number of combinations subject-activity, i.e, number of unique subject multiplied by the number of unique activities. Two for-loops are performed to fill in row by row this data frame.

11/ Write the *result* to "data_average.txt" file.