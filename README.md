This is the tidydata repo.
This repo contains the 4 required objects for the R Getting and Cleaning Data course project.

These objects are as follows.
1 - The tidy data. Its file name is tidy_data.txt.
2 - The R script. Its file name is run_analysis.R.
3 - This readme file. Its file name is README.md.
4 - The code book. Its file name is codebook.md

The following notes document the program flow in the R script.

Use read.table to load the feature names from the data file. The name of the data file is "features.txt".
Subset the feature name rows using grep that contain a match for mean() or std().

Use read.table to load the test measurement data and the train measurement data.
The name of the file that contains the test measurement data is "test/X_test.txt".
The name of the file that contains the train measurement data is "train/X_train.txt".
Use rbind to combine the 2 sets of data into one data frame.

Subset the measurement data. Retain only the 66 columns with the desired feature names.

Use read.table to load the test activity data and the train activity data.
The name of the file that contains the test activity data is "test/y_test.txt".
The name of the file that contains the train activity data is "train/y_train.txt".
Use rbind to combine the 2 sets of data into one data frame,

Use cbind to combine the activity data and the measurements data.

Use read.table to load the test subject data and the train subject data.
The name of the file that contains the test subject data is "test/subject_test.txt".
The name of the file that contains the train subject data is "train/subject_train.txt".
Use rbind to combine the 2 sets of data into one data frame,

Use cbind to Combine the subject data, the activity data and the measurements data.

Change the column names to meaningful names.
Use the aggregate function to calculate the means of all measurements grouped by subject and activity.
Remove the first two columns created by the aggregate function.
Use write.table to save the tidy data to a text file named "tidy_data.txt".
