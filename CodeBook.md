---
title: "CodeBook"
author: "William N. Anderson"
date: "Tuesday, January 20, 2015"
output: html_document
---

## Codebook for the Data Science Course 3 Class Project
The assignment is the *Course Project* for *Getting and Cleaning Data*, which is part 3 of the Coursera Data Science sequence.

### Study description
The study involved Human Activity Recognition Using Smartphones. Data was collected from 30 subjects performing activities of daily living (ADL) while carrying a waist-mounted smartphone with embedded inertial sensors.  For each subject data were collected on a variety of activities. Summary statistics were computed for multiple combinations of subject and activity. For purposes of this Coursera assignment only the summary statistics were used, and no checking has been performed to determine if the summary statistics were correctly computed.

Further study information is available at http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones, Data can be obtained at that site. Selected data and brief descriptions can also be obtained at https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip. Information at the above sites is included here by reference; brief items are repeated for the convenience of the reader.

The data sets contain data on 21 subjects in a training set, and 9 subjects in a test set. There are 6 total activites, and the summary statistics data set contains approximately 30 observations per subject-activity combination. Measurements are given in both the time domain and the frequency domain. The definition of these two domains is irrelevant for the course project, but both domains are of potential importance in applications of the data. 

The following datasets were used. 

* activity_labels.txt.  This set contains the names of the 6 activities.
* X_test.txt and X_train.txt. This set contains the summary statistics for 561 different measurements. There are multiple rows for each subject-activity combination.   
* features.txt.  This set contains names for the 561 summary statistics reported.  Tne number of columns is the same as in the X datasets.
* subject_test.txt and subject_train.txt. This set contains the list of subjects for the measurements. Tne number of rows is the same as in the X datasets.
* y_test.txt and y_train.txt. This set contains the list of activities for the measurements. Tne number of rows is the same as in the X datasets.
* There is no data field to link the various sets. The entire analyisis proceeds on the assumption that the order has been preserved. 


### Project Specs

 Key references for the project are contained on the Coursera web site for the course. The sites are restricted, and course registration or other access permission is required in order to follow the links.    

* The Coursera web site for the course. The links require access to the course.  
    + The project description  https://class.coursera.org/getdata-010/human_grading/view/courses/973497/assessments/3/submissions.    
    + Notes on the project by Community TA David Hood  https://class.coursera.org/getdata-010/forum/thread?thread_id=49

 Information at the above sites is included here by reference; brief items are repeated for the convenience of the reader. 
 
 In brief, the steps in the project are as follows
 
* Merge the training and the test sets to create one data set.
    + The merged set also contains the subjects and activities, as new columns.
    + Because the X sets contain no link fields, the inclusion of subjects and activities is based purely on the order of observations in the data sets involved. 
* Extract only the measurements on the mean and standard deviation for each measurement.
    + As explained in the Hood notes, the requirement for choice of columns is open to interpretation. Sixty four (64) columns were chosen for use in the assignment. The chosen ones seemed to contain the important means and standard deviations. A detailed description of the columns chosen is given below.
* Use descriptive activity names to name the activities in the data set
    + Descriptive activity names were hand entered in the code, as minor modifications of the values in the activity_labels.txt set.
* The columns of the set were given descriptive variable names. These names were taken from the features.txt set, and transformed as follows  
    + All special characters were converted to underscore. 
    + Trailing underscores were removed.
    + The characters Body were replaced by Body where needed
    + The resulting labels can be matched to the original values, because the alphabetic characters were unchanged, except as noted above
* The resulting data set has many rows per subject-activity combination. In principle some subject-activity combinations could have zero rows, but there were no such instances in this data set. 
* Finally, the mean of the values in each column was computed for each subject-activity combination. 

 
 

### Output file  
The output file has been written as the flat answers.txt, and uploaded to the coursera web site. The file is comma delimited, and the character column is not quoted.

The output file contains one row for each Subject, Activity combination. The variables are

*Subject:*     The subject number is taken from the data files subject_test.txt and subject_train.txt, as described above.  
*Activity:*    The activity is taken from the data files Y_test.txt and Y_train.txt, as described above. In the original data files the activities were coded numerically. The Activity values in the output file are quoted characters; for each subject the Activities are in the order of the original coding.  
*Outcome variables*  The various analysis variables come in groups. For ease of reading the order below is slightly different than the order of the columns in the output data set

* In the raw dataset each group there are values for the X, Y, and Z components, and for the magnitude. For each set of observations the mean and standard deviation are given. 
* The groups used in this analysis are the following  
    + *Body Acceleration (time domain):* tBodyAcc_mean_X, tBodyAcc_mean_Y, tBodyAcc_mean_Z, tBodyAccMag_mean,
    tBodyAcc_std_X, tBodyAcc_std_Y, tBodyAcc_std_Z, tBodyAccMag_std
    + *Gravity Acceleration (time domain):*  tGravityAcc_mean_X, tGravityAcc_mean_Y, tGravityAcc_mean_Z, 
    tGravityAccMag_mean, tGravityAcc_std_X, tGravityAcc_std_Y, tGravityAcc_std_Z, tGravityAccMag_std
    + *Body Acceleration Jerk (time domain):* tBodyAccJerk_mean_X, tBodyAccJerk_mean_Y, tBodyAccJerk_mean_Z,
    tBodyAccJerkMag_mean, tBodyAccJerk_std_X, tBodyAccJerk_std_Y, tBodyAccJerk_std_Z, tBodyAccJerkMag_std  
    + *Body Gyroscope (time domain):* tBodyGyro_mean_X, tBodyGyro_mean_Y, tBodyGyro_mean_Z, tBodyGyroMag_mean
    tBodyGyro_std_X, tBodyGyro_std_Y, tBodyGyro_std_Z, tBodyGyroMag_std  
    + *Body Gyroscope Jerk (time domain):* tBodyGyroJerk_mean_X, tBodyGyroJerk_mean_Y, tBodyGyroJerk_mean_Z,
    tBodyGyroJerkMag_mean, tBodyGyroJerk_std_X, tBodyGyroJerk_std_Y, tBodyGyroJerk_std_Z, tBodyGyroJerkMag_std  
    + *Body Acceleration (frequency domain):* fBodyAccc_mean_X, fBodyAcc_mean_Y, fBodyAcc_mean_Z, fBodyAccMag_mean,
    fBodyAcc_std_X, fBodyAcc_std_Y, fBodyAcc_std_Z, fBodyAccMag_std
    + *Body Acceleration Jerk (frequency domain):* fBodyAccJerk_mean_X, fBodyAccJerk_mean_Y, fBodyAccJerk_mean_Z,
    fBodyAccJerk_std_X, fBodyAccJerk_std_Y, fBodyAccJerk_std_Z
    + *Body Gyroscope (frequency domain):* fBodyGyro_mean_X, fBodyGyro_mean_Y, fBodyGyro_mean_Z, fBodyGyroMag_mean,
    fBodyGyro_std_X, fBodyGyro_std_Y, fBodyGyro_std_Z, fBodyGyroMag_std  	
    + *Additional frequency domain:* fBodyGyroJerkMag_mean	fBodyGyroJerkMag_std
     
    
    
