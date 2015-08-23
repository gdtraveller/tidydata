This codebook describes the variables and the data used to clean up the data and the work done to transform the raw data to tidy data.

Use read.table to load the feature names from the data file.
The name of the data file is "features.txt".
Save the data to a variable named feature.names

Subset the feature name rows using grep that contain a match for mean() or std().
Save the data to a variable named d.

Use read.table to load the test measurement data and the train measurement data.
The name of the file that contains the test measurement data is "test/X_test.txt".
The name of the file that contains the train measurement data is "train/X_train.txt".
Save the test measurement data to a variable named test.measurement.data.
Save the train measurement data to a variable named train.measurement.data.

Use rbind to combine the 2 sets of data into one data frame.
Save the combined measurement data to a variable named total.measurement.data.

Subset the measurement data. Retain only the 66 columns with the desired feature names.
Save the subset of the combined measurement data to a variable named tidy.data.

Use read.table to load the test activity data and the train activity data.
The name of the file that contains the test activity data is "test/y_test.txt".
The name of the file that contains the train activity data is "train/y_train.txt".
Save the test activity data to a variable named test.activity.data.
Save the train activity data to a variable named train.activity.data.

Use rbind to combine the 2 sets of data into one data frame,
Save the combined activity data to a variable named total.activity.data.

Use cbind to combine the activity data and the measurements data.
Update tidy.data with the results from cbind.

Use read.table to load the test subject data and the train subject data.
The name of the file that contains the test subject data is "test/subject_test.txt".
The name of the file that contains the train subject data is "train/subject_train.txt".
Save the test subject data to a variable named test.subject.data.
Save the train subject data to a variable named train.subject.data.

Use rbind to combine the 2 sets of data into one data frame,
Save the combined subject data to a variable named total.subject.data.

Use cbind to Combine the subject data, the activity data and the measurements data.
Update tidy.data with the results from cbind.

Change the column names to meaningful names.
Use the aggregate function to calculate the means of all measurements grouped by subject and activity.
Update tidy.data with the results from aggregate

Subset tidy.data by removing the first two columns created by the aggregate function.
Update tidy.data with the subset results.

Use write.table to save the tidy data to a text file named "tidy_data.txt".
