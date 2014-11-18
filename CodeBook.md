#Code Book for 'tidyData.txt'

The following is a Code Book for the "tidyData.txt" file (which is created by using the 'run_analysis.R' script).

There are a total of 180 rows and 68 columns in this dataset.
The rows correspond to 30 participants that were measured on 6 different activity levels (Walking, Walking Upstairs, Walking Downstairs, Sitting, Standing, Laying).  Each participant is measured, using a waist-mounted smartphone with embedded intertial sensors, on a wide range of measurements, referred to in this dataset as 'features'. The final table includes only the means for each participant for each activity, which results in 180 rows (30 x 6).

The columns correspond to 1) an ID variable representing each participant, 2) an Activity label (for the aforementioned activity levels), and 3) a set of variables corresponding to various measurements that are referrred to as the 'features'. Only the mean and standard deviation for each measurement are included in the final dataset.  Since there are 33 measurements of interest, each with a mean and standard deviation, the final set of features includes 66 variables.  These 66 columns are included with the ID and Activity column to create a final dataset with 68 columns.


###Description of the 'features' from the UCI "Human Activity Recognition Using Smartphones" Documentation:
"The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using 
another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). These signals were used to estimate variables of the feature vector for each pattern: '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions."


##VARIABLE NAMES for 'tidyData.txt'

Format: Variable Name: Variable Type, [Min:Max], Description

ID: Integer, [1:30], Participant ID number

Activity: Factor, [1:6], "Walking", "Walking Upstairs", "Walking Downstairs", "Sitting", "Standing", "Laying"

tBodyAcc.mean...X: Numeric, [0.222:0.301], The average mean of the time domain signal for Body Acceleration in the direction of the X-axis

tBodyAcc.mean...Y: Numeric, [-0.041:-0.001], The average mean of the time domain signal for Body Acceleration in the direction of the Y-axis

tBodyAcc.mean...Z: Numeric, [-0.153:-0.075], The average mean of the time domain signal for Body Acceleration in the direction of the Z-axis

tBodyAcc.std...X: Numeric, [-0.996:0.627], The average standard deviation of the time domain signal for Body Acceleration in the direction of the X-axis

tBodyAcc.std...Y: Numeric, [-0.990:0.617], The average standard deviation of the time domain signal for Body Acceleration in the direction of the Y-axis

tBodyAcc.std...Z: Numeric, [-0.988:0.609], The average standard deviation of the time domain signal for Body Acceleration in the direction of the Z-axis

tGravityAcc.mean...X: Numeric, [-0.680:0.975], The average mean of the time domain signal for Gravity Acceleration in the direction of the X-axis

tGravityAcc.mean...Y: Numeric, [-0.480:0.957], The average mean of the time domain signal for Gravity Acceleration in the direction of the Y-axis

tGravityAcc.mean...Z: Numeric, [-0.495:0.958], The average mean of the time domain signal for Gravity Acceleration in the direction of the Z-axis

tGravityAcc.std...X: Numeric, [-0.997:-0.830], The average standard deviation of the time domain signal for Gravity Acceleration in the direction of the X-axis

tGravityAcc.std...Y: Numeric, [-0.994:-0.644], The average standard deviation of the time domain signal for Gravity Acceleration in the direction of the Y-axis

tGravityAcc.std...Z: Numeric, [-0.991:-0.610], The average standard deviation of the time domain signal for Gravity Acceleration in the direction of the Z-axis

tBodyAccJerk.mean...X: Numeric, [0.043:0.130], The average mean of the time domain signal for Body Acceleration Jerk Signals in the direction of the X-axis

tBodyAccJerk.mean...Y: Numeric, [-0.039:0.057], The average mean of the time domain signal for Body Acceleration Jerk Signals in the direction of the Y-axis

tBodyAccJerk.mean...Z: Numeric, [-0.067:0.038], The average mean of the time domain signal for Body Acceleration Jerk Signals in the direction of the Z-axis

tBodyAccJerk.std...X: Numeric, [-0.995:0.544], The average standard deviation of the time domain signal for Body Acceleration Jerk Signals in the direction of the X-axis

tBodyAccJerk.std...Y: Numeric, [-0.990:0.355], The average standard deviation of the time domain signal for Body Acceleration Jerk Signals in the direction of the Y-axis

tBodyAccJerk.std...Z: Numeric, [-0.993:0.031], The average standard deviation of the time domain signal for Body Acceleration Jerk Signals in the direction of the Z-axis

tBodyGyro.mean...X: Numeric, [-0.206:0.193], The average mean of the time domain signal for Angular Velocity in the direction of the X-axis

tBodyGyro.mean...Y: Numeric, [-0.204:0.027], The average mean of the time domain signal for Angular Velocity in the direction of the Y-axis

tBodyGyro.mean...Z: Numeric, [-0.072:0.179], The average mean of the time domain signal for Angular Velocity in the direction of the Z-axis

tBodyGyro.std...X: Numeric, [-0.994:0.268], The average standard deviation of the time domain signal for Angular Velocity in the direction of the X-axis

tBodyGyro.std...Y: Numeric, [-0.994:0.477], The average standard deviation of the time domain signal for Angular Velocity in the direction of the Y-axis

tBodyGyro.std...Z: Numeric, [-0.986:0.565], The average standard deviation of the time domain signal for Angular Velocity in the direction of the Z-axis

tBodyGyroJerk.mean...X: Numeric, [-0.157:-0.022], The average mean of the time domain signal for Angular Velocity Jerk Signals in the direction of the X-axis

tBodyGyroJerk.mean...Y: Numeric, [-0.077:-0.013], The average mean of the time domain signal for Angular Velocity Jerk Signals in the direction of the Y-axis

tBodyGyroJerk.mean...Z: Numeric, [-0.092:-0.007], The average mean of the time domain signal for Angular Velocity Jerk Signals in the direction of the Z-axis

tBodyGyroJerk.std...X: Numeric, [-0.997:0.179], The average standard deviation of the time domain signal for Angular Velocity Jerk Signals in the direction of the X-axis

tBodyGyroJerk.std...Y: Numeric, [-0.997:0.296], The average standard deviation of the time domain signal for Angular Velocity Jerk Signals in the direction of the Y-axis

tBodyGyroJerk.std...Z: Numeric, [-0.995:0.193], The average standard deviation of the time domain signal for Angular Velocity Jerk Signals in the direction of the Z-axis

tBodyAccMag.mean..: Numeric, [-0.986:0.645], The average mean of the time domain signal for the Magnitude of three-dimensional Body Acceleration

tBodyAccMag.std..: Numeric, [-0.986:0.428], The average standard deviation of the time domain signal for the Magnitude of three-dimensional Body Acceleration

tGravityAccMag.mean..: Numeric, [-0.986:0.645], The average mean of the time domain signal for the Magnitude of three-dimensional Gravity Acceleration

tGravityAccMag.std..: Numeric, [-0.986:0.428], The average standard deviation of the time domain signal for the Magnitude of three-dimensional Gravity Acceleration

tBodyAccJerkMag.mean..: Numeric, [-0.993:0.434], The average mean of the time domain signal for the Magnitude of three-dimensional Body Acceleration Jerk Signals

tBodyAccJerkMag.std..: Numeric, [-0.995:0.451], The average standard deviation of the time domain signal for the Magnitude of three-dimensional Body Acceleration Jerk Signals

tBodyGyroMag.mean..: Numeric, [-0.981:0.418], The average mean of the time domain signal for the Magnitude of three-dimensional Angular Velocity

tBodyGyroMag.std..: Numeric, [-0.981:0.300], The average standard deviation of the time domain signal for the Magnitude of three-dimensional Angular Velocity

tBodyGyroJerkMag.mean..: Numeric, [-0.997:0.088], The average mean of the time domain signal for the Magnitude of three-dimensional Angular Velocity Jerk Signals

tBodyGyroJerkMag.std..: Numeric, [-0.998:0.250], The average standard deviation of the time domain signal for the Magnitude of three-dimensional Angular Velocity Jerk Signals

fBodyAcc.mean...X: Numeric, [-0.995:0.537], The average mean of the frequency domain signal (FFT) for Body Acceleration in the direction of the X-axis

fBodyAcc.mean...Y: Numeric, [-0.989:0.524], The average mean of the frequency domain signal (FFT) for Body Acceleration in the direction of the Y-axis

fBodyAcc.mean...Z: Numeric, [-0.989:0.281], The average mean of the frequency domain signal (FFT) for Body Acceleration in the direction of the Z-axis

fBodyAcc.std...X: Numeric, [-0.997:0.659], The average standard deviation of the frequency domain signal (FFT) for Body Acceleration in the direction of the X-axis

fBodyAcc.std...Y: Numeric, [-0.991:0.560], The average standard deviation of the frequency domain signal (FFT) for Body Acceleration in the direction of the Y-axis

fBodyAcc.std...Z: Numeric, [-0.987:0.687], The average standard deviation of the frequency domain signal (FFT) for Body Acceleration in the direction of the Z-axis

fBodyAccJerk.mean...X: Numeric, [-0.995:0.474], The average mean of the frequency domain signal (FFT) for Body Acceleration Jerk Signals in the direction of the X-axis

fBodyAccJerk.mean...Y: Numeric, [-0.989:0.277], The average mean of the frequency domain signal (FFT) for Body Acceleration Jerk Signals in the direction of the Y-axis

fBodyAccJerk.mean...Z: Numeric, [-0.992:0.158], The average mean of the frequency domain signal (FFT) for Body Acceleration Jerk Signals in the direction of the Z-axis

fBodyAccJerk.std...X: Numeric, [-0.995:0.477], The average standard deviation of the frequency domain signal (FFT) for Body Acceleration Jerk Signals in the direction of the X-axis

fBodyAccJerk.std...Y: Numeric, [-0.990:0.350], The average standard deviation of the frequency domain signal (FFT) for Body Acceleration Jerk Signals in the direction of the Y-axis

fBodyAccJerk.std...Z: Numeric, [-0.993:-0.006], The average standard deviation of the frequency domain signal (FFT) for Body Acceleration Jerk Signals in the direction of the Z-axis

fBodyGyro.mean...X: Numeric, [-0.993:0.475], The average mean of the frequency domain signal (FFT) for Angular Velocity in the direction of the X-axis

fBodyGyro.mean...Y: Numeric, [-0.994:0.329], The average mean of the frequency domain signal (FFT) for Angular Velocity in the direction of the Y-axis

fBodyGyro.mean...Z: Numeric, [-0.986:0.492], The average mean of the frequency domain signal (FFT) for Angular Velocity in the direction of the Z-axis

fBodyGyro.std...X: Numeric, [-0.995:0.197], The average standard deviation of the frequency domain signal (FFT) for Angular Velocity in the direction of the X-axis

fBodyGyro.std...Y: Numeric, [-0.994:0.646], The average standard deviation of the frequency domain signal (FFT) for Angular Velocity in the direction of the Y-axis

fBodyGyro.std...Z: Numeric, [-0.987:0.522], The average standard deviation of the frequency domain signal (FFT) for Angular Velocity in the direction of the Z-axis

fBodyAccMag.mean..: Numeric, [-0.987:0.587], The average mean of the frequency domain signal (FFT) for the Magnitude of three-dimensional Body Acceleration

fBodyAccMag.std..: Numeric, [-0.988:0.179], The average standard deviation of the frequency domain signal (FFT) for the Magnitude of three-dimensional Body Acceleration

fBodyBodyAccJerkMag.mean..: Numeric, [-0.994:0.538], The average mean of the frequency domain signal (FFT) for the Magnitude of three-dimensional Body Acceleration Jerk Signals

fBodyBodyAccJerkMag.std..: Numeric, [-0.994:0.316], The average standard deviation of the frequency domain signal (FFT) for the Magnitude of three-dimensional Body Acceleration Jerk Signals

fBodyBodyGyroMag.mean..: Numeric, [-0.987:0.204], The average mean of the frequency domain signal (FFT) for the Magnitude of three-dimensional Angular Velocity

fBodyBodyGyroMag.std..: Numeric, [-0.981:0.237], The average standard deviation of the frequency domain signal (FFT) for the Magnitude of three-dimensional Angular Velocity

fBodyBodyGyroJerkMag.mean..: Numeric, [-0.998:0.147], The average mean of the frequency domain signal (FFT) for the Magnitude of three-dimensional Angular Velocity Jerk Signals

fBodyBodyGyroJerkMag.std..: Numeric, [-0.998:0.288], The average standard deviation of the frequency domain signal (FFT) for the Magnitude of three-dimensional Angular Velocity Jerk Signals


[For more information on the HAR Data Set click here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)
