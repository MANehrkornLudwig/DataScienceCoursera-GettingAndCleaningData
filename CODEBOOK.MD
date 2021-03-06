# Codebook - TidyData

## Description

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

## Source

Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

## Variables

### Subject.ID

Each number identifies the subject who performed the activity. Its range is from 1 to 30. 

### Activity

A factor variable which identifies the activity performed by the subject. Levels and labels are: 
* 1 WALKING
* 2 WALKING.UPSTAIRS
* 3 WALKING.DOWNSTAIRS
* 4 SITTING
* 5 STANDING
* 6 LAYING

The original activity labels contained a "_". This character is replaced with a dot.

### Feature

#### Feature Selection

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 'time') were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag (prefix 'frequence'). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.
* time.BodyAcc.XYZ
* time.GravityAcc.XYZ
* time.BodyAccJerk.XYZ
* time.BodyGyro.XYZ
* time.BodyGyroJerk.XYZ
* time.BodyAccMag
* time.GravityAccMag
* time.BodyAccJerkMag
* time.BodyGyroMag
* time.BodyGyroJerkMag
* frequency.BodyAcc.XYZ
* frequency.BodyAccJerk.XYZ
* frequency.BodyGyro.XYZ
* frequency.BodyAccMag
* frequency.BodyAccJerkMag
* frequency.BodyGyroMag
* frequency.BodyGyroJerkMag

The set of variables that were estimated from these signals are: 
* mean: Mean value
* std: Standard deviation

The final tidy dataset contains the average of each variable for each activity and each subject.

Units of measurement:
* Features are normalized and bounded within [-1,1].

####  Summary of Modifications

The following modifications have been applied to the original data:
* Time is denoted by "time." instead of "t"
* Frequency is denoted by "frequency" instead of "f"
* Only mean values and standard deviations are selected
* Parenthesis are removed from variable labels
* "-" are replaced with "."

