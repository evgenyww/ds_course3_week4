library(dplyr)

# Working directory must be set before calling this script.
# It should contain the following files:
# 1. "test/X_test.txt"
# 2. "test/y_test.txt"
# 3. "test/subject_test.txt"
# 4. "train/X_test.txt"
# 5. "train/y_test.txt"
# 6. "train/subject_test.txt"
# 7. "activity_labels.txt"
# 8. "features.txt"
run_analysis <- function() {
  # Read features from file
  features = read.delim("features.txt", sep = " ", col.names = c("number", "name"), header = FALSE)
  # Convert the feature names into appropriate format for using them as column names
  ## replace "(", ")", "." by "_"
  features[,"name"] = gsub("[(),-]", ".", features[,"name"])
  ## replace all blocks of several dots by one dot
  features[,"name"] = gsub("[.]{2,}", ".", features[,"name"])
  ## replace final dots
  features[,"name"] = gsub("[.]?$", "", features[,"name"])
  
  # Merge the training and the test sets to create one data set
  # Appropriately label the data set with descriptive variable names
  ## bind "x" sets
  x = bind_rows(
    read.delim("test/X_test.txt", sep = "", col.names = features[,"name"], header = FALSE),
    read.delim("train/X_train.txt", sep = "", col.names = features[,"name"], header = FALSE)
  )
  
  ## bind "y" sets
  y = bind_rows(
    read.delim("test/y_test.txt", sep = "", col.names = c("activity.code"), header = FALSE),
    read.delim("train/y_train.txt", sep = "", col.names = c("activity.code"), header = FALSE)
  )
  
  ## bind "subject_test" sets
  subject = bind_rows(
    read.delim("test/subject_test.txt", col.names = c("subject"), header = FALSE),
    read.delim("train/subject_train.txt", col.names = c("subject"), header = FALSE)
  )
  
  # Extract only the measurements on the mean and standard deviation for each measurement.
  ## leave only columns containing ".mean" and "\.std" 
  x = select(x, grep(".mean|.std", names(x), value = TRUE))
  
  # Uses descriptive activity names to name the activities in the data set
  # Replace numerical values in y by their descriptive names
  activity_labels = read.delim("activity_labels.txt", sep = "", col.names = c("activity.code", "activity.name"), header = FALSE)
  y = merge(y, activity_labels, by = "activity.code")["activity.name"]
  
  # Create a second, independent tidy data set
  # with the average of each variable for each activity and each subject.
  ## - merge x, y, and subject into one set, 
  ## - group by "activity.name" and "subject", 
  ## - sumarize with mean for all columns
  means_activity_subject = bind_cols(y, subject, x) %>% group_by(activity.name, subject) %>% summarise_all(funs(mean))
  
  # Save sets
  ## create / recreate output folder "output" into the workspace
  unlink("output", recursive = FALSE, force = FALSE)
  dir.create("output", showWarnings = FALSE)
  ## save sets
  write.csv(x, "output/X.csv")
  write.csv(y, "output/y.csv")
  write.csv(means_activity_subject, "output/means_activity_subjects.csv")
  
}
