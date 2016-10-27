library(dplyr)

featuresList <- read.table("features.txt")
activitiesList <- read.table('activity_labels.txt')


subjectTrain <- read.table("./train/subject_train.txt")
featuresTrain <- read.table("./train/X_train.txt")
activitiesTrain <- read.table("./train/y_train.txt")
subjectTest <- read.table("./test/subject_test.txt")
featuresTest <- read.table("./test/X_test.txt")
activitiesTest <- read.table("./test/y_test.txt")

subject <- rbind(subjectTrain,subjectTest)
features <- rbind(featuresTrain,featuresTest)
activities <- rbind(activitiesTrain,activitiesTest)

# getting mean() and std() features
rowFeatures <- grep("mean()|std()",featuresList$V2)
featuresList <- featuresList[rowFeatures,]
features <- features[,rowFeatures]

# renaming column names
names(features) <- featuresList$V2
names(subject) <- c('subject')
names(activities) <- c('activityID')
names(activitiesList) <- c('activityID','activity')

# adding column subject to merge with df subjectTrain
features <- mutate(features, subject = 1:nrow(features))
activities <- mutate(activities, subject = 1:nrow(activities))
mergeALL <- merge(subject,activities,by="subject")
mergeALL <- merge(mergeALL,activitiesList,by="activityID")
mergeALL <- merge(mergeALL,features,by="subject")

summaryMerge <- mergeALL %>% group_by(subject,activity) %>% summarise_each(funs(mean))

