# tidy_data
Course project for Getting and Cleaning Data Coursera course project.
Script solution by Ian Baron, 21 Feb. 2015

Data description:
  Human activity recognition using smartphones
  30 volunteers (subjects) performing 6 actions (activities) including WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING
  Data normalized to -1 to 1
  By: Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
    Smartlab - Non Linear Complex Systems Laboratory
  Contributing files:
    - 'features.txt': List of all features.
    - 'activity_labels.txt': Links the class labels with their activity name.
    - 'train/X_train.txt': Training set.
    - 'train/y_train.txt': Training labels.
    - 'test/X_test.txt': Test set.
    - 'test/y_test.txt': Test labels.
  
Output:
Mean of the variables by subject by activity, for select variables (only mean and standard deviation-based variables).
  Format: The function outputs an R data.frame. For assignment purposes, an additional step of write.table with no row names was executed for the tidy_data.txt file. To read the txt, try read.table(header=TRUE). The output will have 180 observations of 81 variables.
  Variable names: Activities were switched from numeric to text activity names as more descriptive.

Script:
 This script assumes that the  data is available in an unzipped UCI HAR Dataset folder with the working directory pointing to this folder.
 Read in - the script reads in the original data
 Combines - the script merges the data via cbind and rbind
 Renames/describes - the script adds a reference column for activity descriptions
 Column names added
 Eliminates excess (non-std or mean) fields - via grepl function
 Aggregates calculating the mean of each variable by student by activity.
 
  
