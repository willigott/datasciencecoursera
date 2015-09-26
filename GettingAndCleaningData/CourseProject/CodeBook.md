### Description of relevant variables and explanation of the data processing

## The original data set

The data set which is been analyzed, can be downloaded from [here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones); the following description of the dataset is taken from this page as well. If you are already familiar with the data structure, you can skip to "Processing the data".

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, they captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

For each record it is provided:

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

The dataset includes the following files:

- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second.

## Processing the data

The task is described in README.md. In the following, the steps that are needed to solve these tasks are described as well as the resulting dataset. Please note that there are also several explainatory comments in the script "run_analysis.R".

1) The file "features.txt" is read in. Theses features will serve as columns headers for the actual datasets.

2) The actual data (training and set test) are read in which are in "X_train.txt" and "X_test.txt". Each column represents one of the features read in in step 1).

3) The files "subject_train.txt" and "subject_test.txt" are read in which will later be added to the datasets read in in step 2)

4) The activity labels contained in the file "activity_labels.txt" are read in as well as the files "y_train.txt" and "y_test.txt" which contain the training and test labels, respectively. They will also be added to the datasets read in in step 2) after further processing (see step 5) )

5) The labels contained in "y_train.txt" and "y_test.txt" are replaced by the actual activities based on the "look-up-table" in "activity_labels.txt" to make the data more readable.

6) Data from steps 3) and 5) are added to the datasets from step 2; the columns where these data are stored in are called "subject" and "activity", respectively.

7) The so created datasets are merged and the desired columns selected. In this case, the desired columns are the "activity" and "subject" columns as well as all measurements on the mean and standard deviation for each measurement. This excludes variables as e.g. "meanFreq" and "gravityMean" as there is no standard deviation measurement associated with these variables. Note: if one e.g. uses the command "grep" to select the data, the dimension can differ from the ones created here. 

8) The resulting dataframe is grouped by "activity" and "subject" and the mean for each of the columns is calculated. Steps 7) and 8) are executed using the power of the dplyr package.

9) The dataframe is written to a .txt file called "tidyDataSet.txt".

## Resulting dataset

The dataset created in "run_analysis.R", described above in steps 1-9, has 180 observations and 68 variables. The variables are:

- subject: Represents the subject IDs (integer values in the range [1,30]
- activity: Represents the activity performed (i.e. one of the following: LAYING, SITTING, STANDING, WALKING, WALKING_DOWNSTAIRS, WALKING_UPSTAIRS)
- the remaining 66 columns contain mean values (for the subject given and the activity stated) of 66 different measurements. Their names can be shown by calling the command "names(finalDataSet)" after running "run_analysis.R" which gives.

 [1] "subject"                     "activity"                    "tBodyAcc.mean...X"           "tBodyAcc.mean...Y"          
 [5] "tBodyAcc.mean...Z"           "tGravityAcc.mean...X"        "tGravityAcc.mean...Y"        "tGravityAcc.mean...Z"       
 [9] "tBodyAccJerk.mean...X"       "tBodyAccJerk.mean...Y"       "tBodyAccJerk.mean...Z"       "tBodyGyro.mean...X"         
[13] "tBodyGyro.mean...Y"          "tBodyGyro.mean...Z"          "tBodyGyroJerk.mean...X"      "tBodyGyroJerk.mean...Y"     
[17] "tBodyGyroJerk.mean...Z"      "tBodyAccMag.mean.."          "tGravityAccMag.mean.."       "tBodyAccJerkMag.mean.."     
[21] "tBodyGyroMag.mean.."         "tBodyGyroJerkMag.mean.."     "fBodyAcc.mean...X"           "fBodyAcc.mean...Y"          
[25] "fBodyAcc.mean...Z"           "fBodyAccJerk.mean...X"       "fBodyAccJerk.mean...Y"       "fBodyAccJerk.mean...Z"      
[29] "fBodyGyro.mean...X"          "fBodyGyro.mean...Y"          "fBodyGyro.mean...Z"          "fBodyAccMag.mean.."         
[33] "fBodyBodyAccJerkMag.mean.."  "fBodyBodyGyroMag.mean.."     "fBodyBodyGyroJerkMag.mean.." "tBodyAcc.std...X"           
[37] "tBodyAcc.std...Y"            "tBodyAcc.std...Z"            "tGravityAcc.std...X"         "tGravityAcc.std...Y"        
[41] "tGravityAcc.std...Z"         "tBodyAccJerk.std...X"        "tBodyAccJerk.std...Y"        "tBodyAccJerk.std...Z"       
[45] "tBodyGyro.std...X"           "tBodyGyro.std...Y"           "tBodyGyro.std...Z"           "tBodyGyroJerk.std...X"      
[49] "tBodyGyroJerk.std...Y"       "tBodyGyroJerk.std...Z"       "tBodyAccMag.std.."           "tGravityAccMag.std.."       
[53] "tBodyAccJerkMag.std.."       "tBodyGyroMag.std.."          "tBodyGyroJerkMag.std.."      "fBodyAcc.std...X"           
[57] "fBodyAcc.std...Y"            "fBodyAcc.std...Z"            "fBodyAccJerk.std...X"        "fBodyAccJerk.std...Y"       
[61] "fBodyAccJerk.std...Z"        "fBodyGyro.std...X"           "fBodyGyro.std...Y"           "fBodyGyro.std...Z"          
[65] "fBodyAccMag.std.."           "fBodyBodyAccJerkMag.std.."   "fBodyBodyGyroMag.std.."      "fBodyBodyGyroJerkMag.std.."

Thereby, "tBodyAcc.mean...X" represents mean value of the measurement "tBodyAcc-mean()-X" for the given subject during the stated activity. Alle other names are analogue to this one.
