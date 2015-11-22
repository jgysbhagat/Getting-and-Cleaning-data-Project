# Getting-and-Cleaning-data-Project
 This repository consists of the Readme.file, a codebook file and the R script that cleans 
 the data
R script called run_analysis.R that does the following in order to make a tidy dataset of 
68 variables:
## Merges the training and the test sets to create one data set.
In order to make the complete data set this merges training and the test dataset. Add 
variable names to it.

## Extracts only the measurements on the mean and standard deviation for each measurement. 
Removed duplicated columns and Extract variables that have mean or std 
(standard deviation) in them.
## Uses descriptive activity names to name the activities in the data set
 Added activity names to the dataset by joining labels with the dataset.
## Appropriately labels the data set with descriptive variable names. 
Changed the variable names to be more descriptive by replacing t with time and f with 
frequency.
## From the data set in step 4, creates a second, independent tidy data set with the average 
of each variable for each activity and each subject.
Groups the data by 30 subjects and 6 activities and calculates average for each of 
66 variables
### Note
Codebook contains names of all the variables in the tidy dataset