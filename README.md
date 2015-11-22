##Getting & Cleaning Data - README

Description of how to use run_analysis.R

1/ First, unzip the data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip then rename the extracted folder with "UCI_HAR_Dataset".

2/ Put the folder "UCI_HAR_Dataset" and the run_analysis.R script in the working directory

3/ write "source("run_analysis.R")" command in RStudio 

4/ Two output files will be created in the working directory:
  - data-firstSet.txt (~8 149 Ko) with a data frame called *MyData* which is a clean version of concatenated data in the different sub-folders of "UCI_HAR_Dataset" folder.
  - data_average.txt (~218 Ko) with the data frame called *result* giving the average of each variable for each activity (n=6) and each subject (n = 30)

5/ write "read.table("data_average.txt")" to read the file in R
