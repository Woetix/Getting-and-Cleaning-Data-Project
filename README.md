# Getting-and-Cleaning-Data-Project


run_analysis.R  is a script aggregating data from the dataset :
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
This data is originally found at http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones and contains data on 30 volunteers wearing a smartphone (Samsung Galaxy S II) and performing  6 different activities  (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING).
(see Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto. Smartlab - Non Linear Complex Systems Laboratory DITEN - Università degli Studi di Genova. Via Opera Pia 11A, I-16145, Genoa, Italy.)

THe original data consists of a test set and a training set containing 561 meausurement variables 
The script combines both sets into 1 dataset, extracts all measurements related to Mean and standard variance,and calculates the mean of these variables for each subject and each activity.

The output is a text file : tidydata.txt

information on the variables, data and transformations can be found in the codebook
