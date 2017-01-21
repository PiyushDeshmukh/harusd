# JHU-DS C3 Getting and Cleaning Data

The repository is created in response for the Project of the third Course in the specialization of Data Science offered by Johns Hopkins University.

### Introduction

The [Dataset](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) of [Human Activity Recognition using Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) has been analyzed using a R script. The detailed view of all the transformations is explained in the `CodeBook.md` file.

### Summarizing the process

The following steps were performed while working on this project:

 - The [dataset](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) is downloaded. The directory structure is
 
 
```
 
    ├── activity_labels.txt
    ├── features_info.txt
    ├── features.txt
    ├── README.txt
    ├── test
    │   ├── Inertial Signals
    │   │   ├── body_acc_x_test.txt
    │   │   ├── body_acc_y_test.txt
    │   │   ├── body_acc_z_test.txt
    │   │   ├── body_gyro_x_test.txt
    │   │   ├── body_gyro_y_test.txt
    │   │   ├── body_gyro_z_test.txt
    │   │   ├── total_acc_x_test.txt
    │   │   ├── total_acc_y_test.txt
    │   │   └── total_acc_z_test.txt
    │   ├── subject_test.txt
    │   ├── X_test.txt
    │   └── y_test.txt
    └── train
        ├── Inertial Signals
        │   ├── body_acc_x_train.txt
        │   ├── body_acc_y_train.txt
        │   ├── body_acc_z_train.txt
        │   ├── body_gyro_x_train.txt
        │   ├── body_gyro_y_train.txt
        │   ├── body_gyro_z_train.txt
        │   ├── total_acc_x_train.txt
        │   ├── total_acc_y_train.txt
        │   └── total_acc_z_train.txt
        ├── subject_train.txt
        ├── X_train.txt
        └── y_train.txt
```

 - Transformations as explained in `CodeBook.md` are applied using the script `run_analysis.R`. See the codebook for details.
 
 - The final output has been stored in `tidy_ds.txt` file. To load the output file, use 
 ```
     read.table('tidy_ds.txt', row.names = FALSE, col.names = FALSE, sep = '\t')
 ```
 
 