
### Introduction

The [Dataset](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) of [Human Activity Recognition using Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) has been analyzed using a R script. For a smaller overview, look at the `README` file of the repository.

-------------------

### Overview

The following steps were performed while working on this project:

 - The [dataset](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) is downloaded. The directory structure is

 - Transformations as explained in `CodeBook.md` are applied using the script `run_analysis.R`. See the codebook for details.
 
 - The final output has been stored in `tidy_ds.txt` file. To load the output file, use 
 ```
     read.table('tidy_ds.txt', row.names = FALSE, col.names = FALSE, sep = '\t')
 ```
 
 
----------------

### The Transformations
 
 The transformations made on the dataset can be broadly broken down to the following  steps:
 
  - The training and the test datasets are merged into a single dataset using the rbind function and three helper functions.
    - `merge_features` function is responsible for loading and merging the test and training features into a single dataset known as `features`.
    - `trainX` consists of features of the training dataset.
    - `testX` consists of features of the test dataset.
    - `merge_labels` function is responsible for loading and merging the test and training labels into a single dataset known as `labels`.
    - `trainY` consists of labels of the training dataset.
    - `testY` consists of labels of the test dataset.
    - `merge_subject` function is responsible for loading and merging the test and training subjects into a single dataset known as `subject_data`.
  - The measurements on the mean and standard deviation (i.e. signals containing the strings mean and std) were extracted for each measurement, and the others were discarded. This has been achieved by writing a regular expression for the same.
    - `extract_measurements` function takes `features` as argument and returns nothing.
  - The activity identifiers which were simply written as integers between 1 and 6 previously were replaced with descriptive activity names.
    - `edit_names` takes `labels` as input arguement.
  - Columns with no meaninful names were corrected using the `labeling` function that takes 3 arguments `features`, `labels`, and `subject_data`, which returns a column binded value of the whole dataset.
  - Eventually, a new dataset has been generated with average values for each subject and activity type. The output dataset is loaded to the file `tidy_ds.txt` using the function `load_to_disk()`. Pre-existing file with such a name shall be removed before writing to disk!
  
  
--------------------