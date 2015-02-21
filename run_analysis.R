##Ian Baron
## run_analysis.R
## Programming Assignment - Data Cleaning
##    1) Merges the training and the test sets to create one data set.
##    2) Extracts only the measurements on the mean and 
##        standard deviation for each measurement. 
##    3) Uses descriptive activity names to name the activities in the data set
##    4) Appropriately labels the data set with descriptive variable names. 
##    5) From the data set in step 4, creates a second, 
##        independent tidy data set with the average of each variable 
##        for each activity and each subject.

## The six activities: 
##   1) WALKING 
##   2) WALKING_UPSTAIRS
##   3) WALKING_DOWNSTAIRS
##   4) SITTING
##   5) STANDING
##   6) LAYING

## Subjects: 1-30
## cbind, rbind

run_analysis <- function(){
     ## read in features
     
     ## Read in test data
     ## read in main (fixed width)
     ## read in subject (csv)
     ## read in activity (csv)
     test_main <- read.table("UCI HAR Dataset/test/X_test.txt", header = FALSE, sep = "")
     test_subj <- read.csv("UCI HAR Dataset/test/subject_test.txt", header = FALSE)
     test_act <- read.csv("UCI HAR Dataset/test/Y_test.txt", header = FALSE)
     
     
     ## Read in train data
     ## read in main
     ## read in subject
     ## read in activity
     train_main <- read.table("UCI HAR Dataset/train/X_train.txt", header = FALSE, sep = "")
     train_subj <- read.csv("UCI HAR Dataset/train/subject_train.txt", header = FALSE)
     train_act <- read.csv("UCI HAR Dataset/train/Y_train.txt", header = FALSE)
     
     ## merge mains with activities and subjects
     test_main <- cbind(test_main, test_subj,test_act)
     train_main <- cbind(train_main,train_subj,train_act)
     
     ## merge test and trains
     #print(dim(test_main))
     #print(dim(train_main))
     #return("done")
     
     main <- rbind(test_main,train_main)
     
     ## add in col names
     ## read col names
     fnames_tmp <- read.csv("UCI HAR Dataset/features.txt", header = FALSE, sep = "", stringsAsFactors = FALSE)
     fnames_tmp[562,2] <- "subject"
     fnames_tmp[563,2] <- "activity"
     fnames <- fnames_tmp[,2]
     
     names(main) <- fnames
     
     #return(dim(fnames_tmp))
     
     keeps <- character()
     
     for(i in 1:561){
          mytest <- fnames[i]
          if(grepl("std",mytest)|grepl("mean",mytest)){
               keeps <- c(keeps,mytest)
          }
     }
     
     keeps <- c(keeps,"subject", "activity")
     
     main_slim <- main[,keeps]
     
     mynrows <- nrow(main_slim)
     
     for(i in 1:mynrows){
          if(main_slim[i,"activity"]==1){
               main_slim[i,"activity_ln"] <- "walking"}
          if(main_slim[i,"activity"]==2){
               main_slim[i,"activity_ln"] <- "walking_upstairs"}
          if(main_slim[i,"activity"]==3){
               main_slim[i,"activity_ln"] <- "walking_downstairs"}
          if(main_slim[i,"activity"]==4){
               main_slim[i,"activity_ln"] <- "sitting"}
          if(main_slim[i,"activity"]==5){
               main_slim[i,"activity_ln"] <- "standing"}
          if(main_slim[i,"activity"]==6){
               main_slim[i,"activity_ln"] <- "laying"}
     }
     
     ##tidy <- main_slim
     ##aggregate to the mean for each subject/each activity
     mydf <- aggregate(main_slim[,1:79], list(main_slim$subject, main_slim$activity_ln), mean)
     colnames(mydf)[2] <- "activity"
     colnames(mydf)[1] <- "subject"
     return(mydf)
     
     
     
     ##act_list <- c("walking","walking_upstairs","walking_downstairs","sitting","standing","laying")
     ##for(i in 1:30){
          ##for each subject
          ##for(j in 1:6){
               ##for each activity
               ##create an average row
               ##newRow <- paste("subject",as.character(i),"activity", sep = "_")
          ##}
     ##}
     return(mydf)
     
 
     
     ## delete all non-mean()/std()
     
     ##sort by subj by act
     ## replace nums with activities
     
     ##write_table(file,row.name = FALSE)
}
