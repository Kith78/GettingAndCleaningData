
## Summary script

1. Loads the different datasets. Need to be run in the folder UCI HAR Dataset
2. Combines subjects, features and activities from test and train datasets
3. Selects only mean() and std() from the features set
4. merges the different datatsets (subject, features and activities) in a single dataframe, **mergeALL**
5. summarizes mergeALL by subject and activity, and calculates the means of each variable in the dataframe **summaryMerge**
