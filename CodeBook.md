### Information on this file
This file is based on the file features_info.txt from the following source:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
The general information on variables is a shortened copy of the file above in which only the relevant variables and information were kept. In addition the variable names were adapted to R requirements in order to receive valid column names:
* "-" was replaced by "_"
* "()" was deleted
* single "(" and single ")" were replaced by "."
Information on how the data was transformed can be found in run_analysis.R and README.md

### General information on Variables

Feature Selection 
=================

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc_XYZ
tGravityAcc_XYZ
tBodyAccJerk_XYZ
tBodyGyro_XYZ
tBodyGyroJerk_XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc_XYZ
fBodyAccJerk_XYZ
fBodyGyro_XYZ
fBodyAccMag
fBodyBodyAccJerkMag
fBodyBodyGyroMag
fBodyBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

mean: Mean value
std: Standard deviation
meanFreq: Weighted average of the frequency components to obtain a mean frequency

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean

### General changes between the original data set based on the downloaded data and the calculated data set containing means (data_set_means.txt)

Please note: in contrast to the original variables, the variables used in the newly created table (see "data_set_means.txt") all contain MEAN-values. I did not change the variable names since it is a table with only mean values in it and the variable names are already pretty long.

In addition to the variables mentioned in the above section, two other variables are used:

subject: the id of the person who was doing the experiment
activity: one of the six activities that were done within the experiment, as
        LAYING, SITTING, STANDING, WALKING,  WALKING_DOWNSTAIRS, WALKING_UPSTAIRS

### Units
The subject and activity values naturally do not have a unit, they are factors (although
internally in R they are stored as integer and character).

I suppose that the acceleration values are measured in m/s² (see for example http://user.it.uu.se/~thosc112/olssonkhs2016.pdf), the frequency values are 
measured in Hz.

### Complete list of variables in data_set_means.txt
subject
activity
tBodyAcc_mean_X
tBodyAcc_mean_Y
tBodyAcc_mean_Z
tBodyAcc_std_X
tBodyAcc_std_Y
tBodyAcc_std_Z
tGravityAcc_mean_X
tGravityAcc_mean_Y
tGravityAcc_mean_Z
tGravityAcc_std_X
tGravityAcc_std_Y
tGravityAcc_std_Z
tBodyAccJerk_mean_X
tBodyAccJerk_mean_Y
tBodyAccJerk_mean_Z
tBodyAccJerk_std_X
tBodyAccJerk_std_Y
tBodyAccJerk_std_Z
tBodyGyro_mean_X
tBodyGyro_mean_Y
tBodyGyro_mean_Z
tBodyGyro_std_X
tBodyGyro_std_Y
tBodyGyro_std_Z
tBodyGyroJerk_mean_X
tBodyGyroJerk_mean_Y
tBodyGyroJerk_mean_Z
tBodyGyroJerk_std_X
tBodyGyroJerk_std_Y
tBodyGyroJerk_std_Z
tBodyAccMag_mean
tBodyAccMag_std
tGravityAccMag_mean
tGravityAccMag_std
tBodyAccJerkMag_mean
tBodyAccJerkMag_std
tBodyGyroMag_mean
tBodyGyroMag_std
tBodyGyroJerkMag_mean
tBodyGyroJerkMag_std
fBodyAcc_mean_X
fBodyAcc_mean_Y
fBodyAcc_mean_Z
fBodyAcc_std_X
fBodyAcc_std_Y
fBodyAcc_std_Z
fBodyAcc_meanFreq_X
fBodyAcc_meanFreq_Y
fBodyAcc_meanFreq_Z
fBodyAccJerk_mean_X
fBodyAccJerk_mean_Y
fBodyAccJerk_mean_Z
fBodyAccJerk_std_X
fBodyAccJerk_std_Y
fBodyAccJerk_std_Z
fBodyAccJerk_meanFreq_X 
fBodyAccJerk_meanFreq_Y
fBodyAccJerk_meanFreq_Z
fBodyGyro_mean_X
fBodyGyro_mean_Y
fBodyGyro_mean_Z
fBodyGyro_std_X
fBodyGyro_std_Y
fBodyGyro_std_Z
fBodyGyro_meanFreq_X
fBodyGyro_meanFreq_Y
fBodyGyro_meanFreq_Z
fBodyAccMag_mean
fBodyAccMag_std
fBodyAccMag_meanFreq
fBodyBodyAccJerkMag_mean
fBodyBodyAccJerkMag_std
fBodyBodyAccJerkMag_meanFreq
fBodyBodyGyroMag_mean
fBodyBodyGyroMag_std
fBodyBodyGyroMag_meanFreq
fBodyBodyGyroJerkMag_mean
fBodyBodyGyroJerkMag_std
fBodyBodyGyroJerkMag_meanFreq
angle.tBodyAccMean.gravity.
angle.tBodyAccJerkMean..gravityMean.
angle.tBodyGyroMean.gravityMean.
angle.tBodyGyroJerkMean.gravityMean.
angle.X.gravityMean.
angle.Y.gravityMean.
angle.Z.gravityMean.
