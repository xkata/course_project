This data in this tidy data set is source from Human Activity Recognition Using Smartphones Data Set.
Read more on the url: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
The data set url: http://archive.ics.uci.edu/ml/machine-learning-databases/00240/UCI%20HAR%20Dataset.zip

The data set has measurements from accelerometer and gyroscope signals, for 30 volunteers. 70% of the volunteers generated training data
and the rest test data. Each volunteer was asked to perform 6 activities(WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING), whilst
wearing a Samsung Galaxy S II on the waist. The 3 dimension data was extract from this x,y & z. The data was summarized into 9 set of interest to the tidy data set.

test/subject_test.txt
test/X_test.txt
test/Y_test.txt
train/subject_train.txt
train/X_train.txt
train/Y_train.txt
activity_labels.txt
features.txt

subject*test contains the volunteer carrying the activities

X_*txt contains 561 columns of summarized data, mean, standard deviation, max, min etc as described in features.
Y_*txt contains volunteer ID for each row in X_*txt
activity_labels contains the numeric & character representation of the activities carried out by volunteers.

The script merges the data from test and training data sets and groups the data by volunteer and activity. The calculates the mean
for each measurement.

The scripts reads X_test, Y_test, subject_test column wise, together with all the 561 measurements. The same is done for 
X_train.txt,Y_train.txt and subject_train.txt. These two data sets are merged row wise to return a merged data set with 563
columns. Y_test & Y_train will contain the column with the activity carried out by volunteer, this is labelled as activity.
subject_test.txt & subject_train contain the column with the subject number.
X_test.txt & X_train.txt contain 561 columns, each derivatived by applying a function(mean, standard deviation, max, min etc)
activity_labels.txt contains values numeric to character mapping for Y_test.txt & X_train.txt

features.txt contains a column of 561 rows, these are labels for the column in X_train.txt & X_test.txt.

###Step 1
The first step is the script is merge & label the columns of the data in the text file above. The result is a table with 563 columns, the first two 
being subject & activity, the rest are measurements obtain after applying a function.

###Step 2 
This step extracts only mean and standard deviation of the columns from step 1. The table has 81 columns.

###Step 3
Rename columns with non-descriptive names and replace activity's column numeric values with matching character representation

###Step 4
Group data by column & activity, and for each pair calculate the average of each measurement. Return the a tidy data set with these results

###Data Definition of Tidy data Set

* subject : Volunteer wearing Smartphone
* Activity : Activity Carried out by volunteer
 * TimeOfBodyAcc-XYZ : Mean Time of Body Acceleration along respective axis
* TimeOfBodyAcc-XYZ : Standard deviation Time of Body Acceleration along respective axis
* TimeOfGravityAcc-XYZ  : Mean Time of Gravity Acceleration along respective axis
* TimeOfGravityAcc-XYZ  : Standard deviation Time of Gravity Acceleration along respective axis
* TimeOfBodyAccJerk-XYZ : Mean Jerk signals derived from body linear acceleration along respective axis
* TimeOfBodyAccJerk-XYZ : Standard deviation Jerk signals derived from body linear acceleration along respective axis 
* TimeOfBodyGyro-XYZ : Mean Time of Body angular velocity along respective axis
* TimeOfBodyGyro-XYZ : Standard deviation Time of Body angular velocity along respective axis
* TimeOfBodyGyroJerk-XYZ : Mean Jerk signals derived from Body angular velocity along respective axis
* TimeOfBodyGyroJerk-XYZ : Standard deviation Jerk signals derived from Body angular velocity along respective axis
* TimeOfBodyAccMagnitude : Mean of magnitude for the 3-axial Acceleration signal for body
* TimeOfBodyAccMagnitude : Standard deviation of magnitude for the 3-axial Acceleration signal for body
* TimeOfGravityAccMagnitude : Mean of magnitude for the 3-axial Acceleration signal for Gravity
* TimeOfGravityAccMagnitude : Standard deviation of magnitude for the 3-axial Acceleration signal for Gravity
* TimeOfBodyAccJerkMagnitude : Mean of magnitude for the 3-axial signal Jerk for Body derived from Acceleration
* TimeOfBodyAccJerkMagnitude: Standard deviation of magnitude for the 3-axial signal Jerk for Body derived from Acceleration
* TimeOfBodyGyroMagnitude: Mean of magnitude for the 3-axial signal for Body derived from angular velocity
* TimeOfBodyGyroMagnitude: Standard deviation of magnitude for the 3-axial signal for Body derived from angular velocity
* TimeOfBodyGyroJerkMagnitude : Mean of magnitude for the 3-axial signal Jerk for Body derived from angular velocity
* TimeOfBodyGyroJerkMagnitude : Standard deviation of magnitude for the 3-axial signal Jerk for Body derived from angular velocity
* FreQBodyAcc-XYZ : Mean Frequency of Body Acceleration along respective axis
* FreQBodyAcc-XYZ : Standard deviation Frequency of Body Acceleration along respective axis
* FreQBodyAccJerk-XYZ : Mean Frequency of Jerk signals derived from body linear acceleration along respective axis
* FreQBodyAccJerk-XYZ : Standard deviation Frequency of Jerk signals derived from body linear acceleration along respective axis
* FreQBodyGyro-XYZ : Mean Frequency of Body angular velocity along respective axis
* FreQBodyGyro-XYZ : Standard deviation Frequency of Body angular velocity along respective axis
* FreQBodyAccMagnitude : Mean Frequency of magnitude for the 3-axial Acceleration signal for body
* FreQBodyAccMagnitude : Standard deviation Frequency of magnitude for the 3-axial Acceleration signal for body
* FreQBodyAccJerkMagnitude : Mean Frequency of magnitude for the 3-axial signal Jerk for Body derived from Acceleration
* FreQBodyAccJerkMagnitude : Mean Frequency of magnitude for the 3-axial signal Jerk for Body derived from Acceleration
* FreQBodyGyroMagnitude : Mean Frequency of magnitude for the 3-axial signal for Body derived from angular velocity
* FreQBodyGyroMagnitude : Standard deviation Frequency of magnitude for the 3-axial signal for Body derived from angular velocity
* FreQBodyGyroJerkMagnitude : Mean Frequency of magnitude for the 3-axial signal for Body Jerk derived from angular velocity
* FreQBodyGyroJerkMagnitude : Standard deviation Frequency of magnitude for the 3-axial signal for Body Jerk derived from angular velocity
