#Readme for Coursera course project of "Getting and cleaning data"
Ludvig Kratz
2015-08-12

The project consist of 2 R files and a codebook:
run_analysis.R
write_codebook.R
CodeBook.md

##run_analysis.R
Uses packages: dplyr
This script merges the training and test data from the Human Activity Recognition Using Smartphones Data Set. 
If the dataset is not found in the working directory, it will be downloaded and unziped in the currenty working
directory. Then the script extracts the mean and std of each measurements and names the column names appropriate.
The script also creates a data set that averages each measurement of activity and subject. 

##write_codebook.R
Constructs a codebook.md from the variables.

##CodeBook.md
Explaination of the dataset and each variable.