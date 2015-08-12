## - Ludvig Kratz
## - 2015-08-12
## - Coursera: Getting and Cleaning Data
## - Course Project
run_analysis <- function(){
      library(dplyr)
      ################################################################
      ## This section downloads the data set if necessary
      ################################################################
      
      #Checks if the UCI HAR Dataset exists in the current working directory(wd)
      #If not, it will download it and unzip it in the wd
      if (!file.exists("UCI HAR Dataset")) {
            dataUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
            if (!file.exists("data")) {
                  dir.create("data")
            }
            dest <- "./data/smartphones.zip"
            download.file(dataUrl, destfile = dest, method = "curl")
            ##Unzips the folder in the current working directory
            unzip(zipfile = dest)
      }
      
      ################################################################
      ## This section obtains all the rows which corresponds to either
      ## mean or std
      ################################################################
      
      # Load all feasture and label names
      features_names <- read.table(file = "./UCI HAR Dataset/features.txt")
      activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")
      
      #Extract columns that cointain mean or std (V2 is the name of the feature)
      #Exclude columns that contain meanFreq and angle, not real "mean"s
      mean_col1 <- grepl("mean", features_names$V2)
      mean_col2 <- grepl("Mean", features_names$V2)
      std_col <- grepl("std", features_names$V2)
      exclude_col1 <- grepl("meanFreq", features_names$V2)
      exclude_col2 <- grepl("angle", features_names$V2)
      #We want the rows that are TRUE either on mean or std but only ones that
      #are false in the exclude:
      relevent_col <- ((mean_col1 | mean_col2 | std_col) & !exclude_col1) & !exclude_col2
      
      #################################################################
      ## Step 1, 2
      ## This section load the test and train sets and then merges them
      ## on all columns
      #################################################################
      
      train_set <- read.table(file = "./UCI HAR Dataset/train/X_train.txt", stringsAsFactors = FALSE)
      train_label <- read.table(file = "./UCI HAR Dataset/train/y_train.txt", stringsAsFactors = FALSE)
      train_subject <- read.table(file = "./UCI HAR Dataset/train/subject_train.txt", stringsAsFactors = FALSE)
      colnames(train_label) <- "Activity"
      
      test_set <- read.table(file = "./UCI HAR Dataset/test/X_test.txt", stringsAsFactors = FALSE)
      test_label <- read.table(file = "./UCI HAR Dataset/test/y_test.txt", stringsAsFactors = FALSE)
      test_subject <- read.table(file = "./UCI HAR Dataset/test/subject_test.txt", stringsAsFactors = FALSE)
      colnames(test_label) <- "Activity"
      
      
      
      train_set <- cbind(train_set, train_label, train_subject)
      test_set <- cbind(test_set, test_label, test_subject)
      
      data_set <- rbind(train_set, test_set)
      
      
      #Subset all the rows that coresponds to either mean or std
      #Add true statement for the activity label and subject
      relevent_col <- c(relevent_col, c(TRUE, TRUE))
      data_set <- data_set[,relevent_col]
      
      
      #################################################################
      ## Step 3, 4
      ## This section names the columns of the data set with the names
      ## from features.txt
      #################################################################
      
      colNames <- features_names$V2[relevent_col]
      #Convert abbreviations to full words
      colNames <- gsub("Acc", "Acceleration", colNames)
      colNames <- gsub("Mag", "Magnitude", colNames)
      colNames <- gsub("Gyro", "Gyroscope", colNames)
      
      #Name the labels column
      colNames[length(colNames)-1] <- "Activity"
      colNames[length(colNames)] <- "Subject"
      
      colnames(data_set) <- colNames
      
      #Convert the factor levels of activity to desciptive names from
      #activiy_labels.txt stored in activity_labels
      data_set$Activity <- as.factor(data_set$Activity)
      levels(data_set$Activity) <- activity_labels$V2
      
      
      
      #################################################################
      ## Step 5.
      ## This section creates the data set with average of each 
      ## variable for each acitivity and subject
      #################################################################
      
      #Group by activiy and subject
      grouped_data <- group_by(data_set, Activity, Subject)
      #Take the mean of each variable, grouped by activity
      averaged_data <- summarise_each(grouped_data, funs(mean))
      
      
      
      write.table(averaged_data, file = "./data/tidy_data_step_5.txt", row.names = FALSE)

      #Return data_set from step 4.
      data_set
}
      
