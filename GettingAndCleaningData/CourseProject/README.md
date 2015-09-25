### Course project for "Getting and Cleaning Data"

## Task of the course project

You should create one R script called "run_analysis.R" that does the following:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive activity names.
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Steps on how to run the required analysis for the course project

1. Download the data from [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) and unzip the folder. You should now have a folder called "UCI HAR Dataset" in your directory of choice.
2. Save the script "run_analysis.R" from this repository in the same directory in which you unzipped the data folder.
3. Open a terminal or RStudio in the same directory where you put "run_analysis.R" and execute the file. The output will be a .txt file called "tidyDataSet.txt"

## Dependencies

The only library which is required to execute the file "run_analysis.R" is "dplyr". If it is not installed yet, you can do so by typing "install.packages(dplyr)" in the terminal/RStudio interface with an open R session.
