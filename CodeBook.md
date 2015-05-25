#codeBook
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
