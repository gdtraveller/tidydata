tidy.data.column.names <- function(feature.names) {
  
  # Load the feature names from the data file
  #feature.names <- read.table("features.txt")
  
  # Return all the feature name rows that contain a match for mean() or std()
  #d <- feature.names[grep("mean\\(\\)|std\\(\\)", feature.names$V2),]
  
  all.column.names <- c("Subject", "Activity")
  
  for (i in feature.names[,2]) {
    i <- as.character(i)
    i <- gsub('-','',i)
    i <- gsub('\\(\\)','',i)
  
    # create a character vector with one element named "Average".
    full.name <- c("Average")
  
    while ( nchar(i) > 0 ) {
      if ( grepl ("^f", i )) {
        full.name <- paste (full.name, "Frequency.Domain", sep=".")
        if ( nchar(i) == 1 ) {
          all.column.names <- c( all.column.names, full.name)
          break
        }
        i <- substring(i,2)
        next
      }
      if ( grepl ("^t", i )) {
        full.name <- paste (full.name, "Time.Domain", sep=".")
        if ( nchar(i) == 1 ) {
          all.column.names <- c( all.column.names, full.name)
          break
        }
        i <- substring(i,2)
        next
      }
      if ( grepl ("^Body", i )) {
        full.name <- paste (full.name, "Body", sep=".")
        if ( nchar(i) == 4 ) {
          all.column.names <- c( all.column.names, full.name)
          break
        }
        i <- substring(i,5)
        next
      }
      if ( grepl ("^Gravity", i )) {
        full.name <- paste (full.name, "Gravity", sep=".")
        if ( nchar(i) == 7 ) {
          all.column.names <- c( all.column.names, full.name)
          break
        }
        i <- substring(i,8)
        next
      }
      if ( grepl ("^Gyro", i )) {
        full.name <- paste (full.name, "Gyro", sep=".")
        if ( nchar(i) == 4 ) {
          all.column.names <- c( all.column.names, full.name)
          break
        }
        i <- substring(i,5)
        next
      }
      if ( grepl ("^Acc", i )) {
        full.name <- paste (full.name, "Acceleration", sep=".")
        if ( nchar(i) == 3 ) {
          all.column.names <- c( all.column.names, full.name)
          break
        }
        i <- substring(i,4)
        next
      }
      if ( grepl ("^Jerk", i )) {
        full.name <- paste (full.name, "Jerk", sep=".")
        if ( nchar(i) == 4 ) {
          all.column.names <- c( all.column.names, full.name)
          break
        }
        i <- substring(i,5)
        next
      }
      if ( grepl ("^Mag", i )) {
        full.name <- paste (full.name, "Magnitude", sep=".")
        if ( nchar(i) == 3 ) {
          all.column.names <- c( all.column.names, full.name)
          break
        }
        i <- substring(i,4)
        next
      }
      if ( grepl ("^mean", i )) {
        full.name <- paste (full.name, "Mean", sep=".")
        if ( nchar(i) == 4 ) {
          all.column.names <- c( all.column.names, full.name)
          break
        }
        i <- substring(i,5)
        next
      }
      if ( grepl ("^std", i )) {
        full.name <- paste (full.name, "Standard.Deviation", sep=".")
        if ( nchar(i) == 3 ) {
          all.column.names <- c( all.column.names, full.name)
          break
        }
        i <- substring(i,4)
        next
      }
      if ( grepl ("^X", i )) {
        full.name <- paste (full.name, "X.direction", sep=".")
        if ( nchar(i) == 1 ) {
          all.column.names <- c( all.column.names, full.name)
          break
        }
        i <- substring(i,2)
        next
      }
      if ( grepl ("^Y", i )) {
        full.name <- paste (full.name, "Y.direction", sep=".")
        if ( nchar(i) == 1 ) {
          all.column.names <- c( all.column.names, full.name)
          break
        }
        i <- substring(i,2)
        next
      }
      if ( grepl ("^Z", i )) {
        full.name <- paste (full.name, "Z.direction", sep=".")
        if ( nchar(i) == 1 ) {
          all.column.names <- c( all.column.names, full.name)
          break
        }
        i <- substring(i,2)
        next
      } #End if
    }   #End while
  }     #End for
  return (all.column.names)
}       #End function

# Load the feature names from the data file
feature.names <- read.table("features.txt")

# Return all the feature name rows that contain a match for mean() or std()
d <- feature.names[grep("mean\\(\\)|std\\(\\)", feature.names$V2),]

# Return a sorted vector for the column numbers of the selected feature names
col.nums <- d[order(d[,1]),1]

# Load the test measurement data and the train measurement data and combine them into one data frame
test.measurement.data <- read.table("test/X_test.txt")
train.measurement.data <- read.table("train/X_train.txt")
total.measurement.data <- rbind(test.measurement.data, train.measurement.data)

# Subset the measurement data. Retain only those columns with the desired feature names.
tidy.data <- total.measurement.data[,col.nums]

# Load the test activity data and the train activity data and combine them into one data frame
test.activity.data <- read.table("test/y_test.txt")
train.activity.data <- read.table("train/y_train.txt")
total.activity.data <- rbind(test.activity.data, train.activity.data)

# Combine the activity data frame and the measurements data frame
tidy.data <- cbind(total.activity.data, tidy.data)

# Load the test subject data and the train subject data and combine them into one data frame
test.subject.data <- read.table("test/subject_test.txt")
train.subject.data <- read.table("train/subject_train.txt")
total.subject.data <- rbind(test.subject.data, train.subject.data)

# Combine the subject data frame, the activity data frame and the measurements data frame
tidy.data <- cbind(total.subject.data, tidy.data)

# Change the column names to meaningful names
colnames(tidy.data) <- tidy.data.column.names(d)

# Use the aggregate function to calculate the means of all measurements grouped by subject and activity.
tidy.data <- aggregate(tidy.data, by=list(tidy.data$Subject,tidy.data$Activity), FUN=mean, subset=c(3:68))

# Remove the first two columns created by the aggregate function.
tidy.data <- tidy.data[,3:70]

# Save the tidy data to a text file
write.table(tidy.data, file="tidy_data.txt", row.names=FALSE)
