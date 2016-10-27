# GettingAndCleaningData

## Summary script (dataanalysis.R)
Running dataanalysis.R (needs to be in the folder UCI HAR Dataset, data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)  generates two .txt file:

1. **mergeALL.txt** is the merging of both test and train datasets, only looking at mean() and std() factors from the original datasets
5. **summaryMerge.txt** summarizes the average of each mean() and std() factors by subject and activity 

## Libraries used
dplyr 
