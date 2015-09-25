#A detailed description of variables and the procedure can be found in CodeBook.md and README.md

library(dplyr)

#read in features and assign proper names to the columns
features <- read.table("UCI HAR Dataset/features.txt", header = FALSE, sep = "", col.names = c('index', 'name'))

#read in the datasets and use the features as column names
dataTrain <- read.table("UCI HAR Dataset/train/X_train.txt", sep="", header = FALSE, col.names = features$name)
dataTest <- read.table("UCI HAR Dataset/test/X_test.txt", sep="", header = FALSE, col.names = features$name)

#read in subjects and assign a proper name to the column
subTest <- read.table("UCI HAR Dataset/test/subject_test.txt", header = FALSE, col.names = "subject")
subTrain <- read.table("UCI HAR Dataset/train/subject_train.txt", header = FALSE, col.names = "subject")

#read in the activity labels and assign proper names to the columns
actLabels <- read.table("UCI HAR Dataset/activity_labels.txt", header = FALSE, sep="", col.names = c("index", "label"))
actLabTrain <- read.table("UCI HAR Dataset/train/y_train.txt", header = FALSE, col.names = "activity")
actLabTest  <- read.table("UCI HAR Dataset/test/y_test.txt", header = FALSE, col.names = "activity")

#match/replace numbers to/by the actual activities
#using "match" is much more efficient than using a for-loop
actLabTrain$activity <-  actLabels[match(actLabTrain$activity, actLabels$index), 2, drop = TRUE]
actLabTest$activity <-  actLabels[match(actLabTest$activity, actLabels$index), 2, drop = TRUE]

#add columns "subject" and "activity" to the data sets using the data read in above
dataTrain <- mutate(dataTrain, subject = subTrain$subject, activity = actLabTrain$activity)
dataTest <- mutate(dataTest, subject = subTest$subject, activity = actLabTest$activity)

#merge the two datasets
dataMerged <- merge(dataTrain, dataTest, all = TRUE)

#use the power of dplyr and first select your desired columns, group the data by the subject and activity columns
#and then calculate the mean
#the dimensions of the datset are correct according to https://class.coursera.org/getdata-032/forum/thread?thread_id=191
finalDataSet <- dataMerged %>%
  select( subject, activity, contains(".mean."), contains(".std.")) %>%
  group_by(subject, activity) %>%
  summarise_each(funs(mean))  

#write data to a file and remove quotes which makes it easier to read in the data later on
write.table(finalDataSet, "tidyDataSet.txt", row.name = FALSE, quote = FALSE)


