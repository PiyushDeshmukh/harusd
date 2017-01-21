library(plyr)

# Step - 1
# Merging the training and test datasets into a single dataset
merge_x <- function()
{
    trainX <- read.table("train/X_train.txt")
    testX <- read.table("test/X_test.txt")
    dataX <- rbind(trainX, testX)
    dataX
}

merge_y <- function()
{
    trainY <- read.table("train/y_train.txt")
    testY <- read.table("test/y_test.txt")
    dataY <- rbind(trainY, testY)
    dataY
}

merge_subject <- function()
{
    subject_train <- read.table("train/subject_train.txt")
    subject_test <- read.table("test/subject_test.txt")
    subject_data <- rbind(subject_train, subject_test)
    subject_data
}

# Step - 2
# Extracting measurements on mean and std
extract_measurements <- function(dataX)
{
    features <- read.table("features.txt")
    mean_and_std <- grep("-(std|mean)\\(\\)", features[, 2])
    dataX <- dataX[, mean_and_std]
    names(dataX) <- features[mean_and_std, 2]
}

# Step - 3
# Changing names to descriptive activity names to name activities in the dataset

edit_names <- function(dataY)
{
    activities <- read.table("activity_labels.txt")
    dataY[, 1] <- activities[dataY[, 1], 2]
    names(dataY) <- "activity"
}

# Step - 4
# Labeling dataset with descriptive variable names

labeling <- function(subject_data, dataX, dataY)
{
    names(subject_data) <- "subject"
    all_data <- cbind(dataX, dataY, subject_data)
    all_data
}

# Step - 5
# Creating independent tidy data set

load_to_disk <- function(alldata)
{
    filename = 'tidy_ds.txt'
    if (file.exists(filename))
    {
        file.remove(filename)
    }
    avgs <- ddply(all_data, .(subject, activity), function(x) colMeans(x[, 1:66]))
    write.table(avgs, "tidy_ds.txt", col.names = FALSE, row.names = FALSE, sep='\t')
}


###############################################################################
###############################################################################

# Merges the training and the test sets to create one data set.
dataX <- merge_x()
dataY <- merge_y()
subject_data <- merge_subject()

# Extracts only the measurements on the mean and standard deviation for each measurement.
extract_measurements(dataX)

# Uses descriptive activity names to name the activities in the data set
edit_names(dataY)

# Appropriately labels the data set with descriptive variable names.
all_data <- labeling(subject_data = subject_data, dataX = dataX, dataY = dataY)

# Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
load_to_disk(all_data)