# Home directory = "C:/coursera/data_scientist_training/UCI _HAR _Dataset"
#import data
X_test <- read.table("C:/coursera/data_scientist_training/UCI _HAR _Dataset/test/X_test.txt", quote="\"")
X_train <- read.table("C:/coursera/data_scientist_training/UCI _HAR _Dataset/train/X_train.txt", quote="\"")

#Merges the training and the test sets to create one data set.
X_rbind <- rbind(X_train, X_test)

#Extracts only the measurements on the mean and standard deviation for each measurement. 


X_stdmean <- X_rbind[, c("V1","V2","V3","V4","V5","V6","V41","V42","V43","V44","V45","V46","V81","V82","V83","V84","V85","V86","V121","V122","V123","V124","V125","V126","V161","V162","V163","V164","V165","V166","V201","V202","V214","V215","V227","V228","V240","V241","V253","V254","V266","V267","V268","V269","V270","V271","V294","V295","V296","V345","V346","V347","V348","V349","V350","V373","V374","V375","V424","V425","V426","V427","V428","V429","V452","V453","V454","V503","V504","V513","V516","V517","V526","V529","V530","V539","V542","V543","V552","V555","V556","V557","V558","V559","V560","V561")]

#Uses descriptive activity names to name the activities in the data set

X_stdmean_lbl <- X_stdmean

colnames(X_stdmean_lbl) <- c("tBodyAcc-mean-X","tBodyAcc-mean-Y","tBodyAcc-mean-Z","tBodyAcc-std-X","tBodyAcc-std-Y","tBodyAcc-std-Z","tGravityAcc-mean-X","tGravityAcc-mean-Y","tGravityAcc-mean-Z","tGravityAcc-std-X","tGravityAcc-std-Y","tGravityAcc-std-Z","tBodyAccJerk-mean-X","tBodyAccJerk-mean-Y","tBodyAccJerk-mean-Z","tBodyAccJerk-std-X","tBodyAccJerk-std-Y","tBodyAccJerk-std-Z","tBodyGyro-mean-X","tBodyGyro-mean-Y","tBodyGyro-mean-Z","tBodyGyro-std-X","tBodyGyro-std-Y","tBodyGyro-std-Z","tBodyGyroJerk-mean-X","tBodyGyroJerk-mean-Y","tBodyGyroJerk-mean-Z","tBodyGyroJerk-std-X","tBodyGyroJerk-std-Y","tBodyGyroJerk-std-Z","tBodyAccMag-mean","tBodyAccMag-std","tGravityAccMag-mean","tGravityAccMag-std","tBodyAccJerkMag-mean","tBodyAccJerkMag-std","tBodyGyroMag-mean","tBodyGyroMag-std","tBodyGyroJerkMag-mean","tBodyGyroJerkMag-std","fBodyAcc-mean-X","fBodyAcc-mean-Y","fBodyAcc-mean-Z","fBodyAcc-std-X","fBodyAcc-std-Y","fBodyAcc-std-Z","fBodyAcc-meanFreq-X","fBodyAcc-meanFreq-Y","fBodyAcc-meanFreq-Z","fBodyAccJerk-mean-X","fBodyAccJerk-mean-Y","fBodyAccJerk-mean-Z","fBodyAccJerk-std-X","fBodyAccJerk-std-Y","fBodyAccJerk-std-Z","fBodyAccJerk-meanFreq-X","fBodyAccJerk-meanFreq-Y","fBodyAccJerk-meanFreq-Z","fBodyGyro-mean-X","fBodyGyro-mean-Y","fBodyGyro-mean-Z","fBodyGyro-std-X","fBodyGyro-std-Y","fBodyGyro-std-Z","fBodyGyro-meanFreq-X","fBodyGyro-meanFreq-Y","fBodyGyro-meanFreq-Z","fBodyAccMag-mean","fBodyAccMag-std","fBodyAccMag-meanFreq","fBodyBodyAccJerkMag-mean","fBodyBodyAccJerkMag-std","fBodyBodyAccJerkMag-meanFreq","fBodyBodyGyroMag-mean","fBodyBodyGyroMag-std","fBodyBodyGyroMag-meanFreq","fBodyBodyGyroJerkMag-mean","fBodyBodyGyroJerkMag-std","fBodyBodyGyroJerkMag-meanFreq","angletBodyAccMean-gravity","angletBodyAccJerkMean-gravityMean","angletBodyGyroMean-gravityMean","angletBodyGyroJerkMean-gravityMean","angleX-gravityMean","angleY-gravityMean","angleZ-gravityMean")
> View(X_stdmean_lbl)


#import activities information from train and test folders
activities_train <- read.table("C:/coursera/data_scientist_training/UCI _HAR _Dataset/train/y_train.txt", quote="\"")

activities_test <- read.table("C:/coursera/data_scientist_training/UCI _HAR _Dataset/test/y_test.txt", quote="\"")

#Merges activities list from the  training and the test sets to create one data set.
activities_rbind <- rbind(activities_train, activities_test)

#label activity column
colnames(activities_rbind) <- c("Activities")

#format activity codes

Activity$Activities[Activity$Activities==1] <-"WALKING"
Activity$Activities[Activity$Activities==2] <-"WALKING_UPSTAIRS"
Activity$Activities[Activity$Activities==3] <-"WALKING_DOWNSTAIRS"
Activity$Activities[Activity$Activities==4] <-"SITTING"
Activity$Activities[Activity$Activities==5] <-"STANDING"
Activity$Activities[Activity$Activities==6] <-"LAYING"
Activity$Activities[Activity$Activities=="WALKING_UPSTAIR] <-"WALKING_UPSTAIRs"

#attach formatted activity table with Data table

act_data <- cbind(Activity, X_stdmean_lbl)

#---------------
#import subjects information
subject_train <- read.table("C:/coursera/data_scientist_training/UCI _HAR _Dataset/train/subject_train.txt", quote="\"")
subject_test <- read.table("C:/coursera/data_scientist_training/UCI _HAR _Dataset/test/subject_test.txt", quote="\"")

#Merges Subject list from the  training and the test sets to create one data set.
subject_rbind <- rbind(subject_train, subject_test)

#label subject column
colnames(subject_rbind) <- c("Subjects")

#attach formatted subject table with Data table
subj_act_data <- cbind(subject_rbind,act_data)

-----------
#simplification (reason the logic that is applied here demonstrate how the dat is processed)
#I took just the first subjects, activities and the first 3 measurements from the my data for further processing
#	1 tBodyAcc-mean()-X
#	2 tBodyAcc-mean()-Y
#	3 tBodyAcc-mean()-Z

simple_data <- subj_act_data[,c(1,2,3,4,5)]

#i have to rename the column because for some reason sqldf complains when it encounter "_" in the field name

colnames(simple_data) <- c("subjects","activities","tbdaccmnx", "tbdaccmny", "tbdaccmnz")

#sqldf required
library(sqldf)

#used sql to group average by subject and activities

tidy_data <- sqldf("select Subjects,Activities, avg(tbdaccmnx) 'avg_tBody_Acc_X',avg(tbdaccmnx) 'avg_tBody_Acc_Y',avg(tbdaccmnz) 'avg_tBody_Acc_Z' from simple_data group by subjects, activities")
View(tidy_data)



