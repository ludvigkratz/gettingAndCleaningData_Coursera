

write_codebook <- function(){      
      source("run_analysis.R")
      variables <- names(run_analysis())
      
      new_variables <- variables[!(variables %in% "()-Y")]
      new_variables <- new_variables[!(new_variables %in% "()-Z")]
      descrip <- new_variables
      

      
      explanation <- descrip
      explanation <- gsub("()-X", "", explanation, fixed = TRUE)
      explanation <- gsub("()-Y", "", explanation, fixed = TRUE)
      explanation <- gsub("()-Z", "", explanation, fixed = TRUE)
      descrip <- gsub("()-X", "-XYZ", descrip, fixed = TRUE)
      descrip <- gsub("()-Y", "-XYZ", descrip, fixed = TRUE)
      descrip <- gsub("()-Z", "-XYZ", descrip, fixed = TRUE)
      
      
      ############################################################################
      ## Time domain
      ############################################################################
      explanation <- gsub("tBodyAcceleration-mean", "The mean acceleration of body in time domain, in direction X/Y/Z", explanation)
      explanation <- gsub("tBodyAcceleration-std", "The standard deviation of acceleration of body in time domain, in direction X/Y/Z", explanation)
      
      explanation <- gsub("tGravityAcceleration-mean", "The mean gravity acceleration in time domain, in direction X/Y/Z", explanation)
      explanation <- gsub("tGravityAcceleration-std", "The standard deviation of gravity acceleration in time domain, in direction X/Y/Z", explanation)
      
      explanation <- gsub("tBodyAccelerationJerk-mean", "The mean jerk acceleration of the body in time domain, in direction X/Y/Z", explanation)
      explanation <- gsub("tBodyAccelerationJerk-std", "The standard deviation of jerk acceleration of the body in time domain, in direction X/Y/Z", explanation)
      
      explanation <- gsub("tBodyGyroscope-mean", "The mean gyroscope of the body in time domain, in direction X/Y/Z", explanation)
      explanation <- gsub("tBodyGyroscope-std", "The standard deviation of gyroscope of the body in time domain, in direction X/Y/Z", explanation)
      
      explanation <- gsub("tBodyGyroscopeJerk-mean", "The mean gyroscope jerk of the body in time domain, in direction X/Y/Z", explanation)
      explanation <- gsub("tBodyGyroscopeJerk-std", "The standard deviation of gyroscope jerk of the body in time domain, in direction X/Y/Z", explanation)
      
      explanation <- gsub("tBodyAccelerationMagnitude-mean()", "The mean magnitude of the acceleration of the body in time domain", explanation,fixed = TRUE)
      explanation <- gsub("tBodyAccelerationMagnitude-std()", "The standard deviation of  magnitude of the acceleration of the body in time domain", explanation,fixed = TRUE)
      
      explanation <- gsub("tGravityAccelerationMagnitude-mean()", "The mean magnitude of the gravity acceleration in time domain", explanation,fixed = TRUE)
      explanation <- gsub("tGravityAccelerationMagnitude-std()", "The standard deviation of  magnitude of the gravity acceleration in time domain", explanation,fixed = TRUE)
      
      explanation <- gsub("tBodyAccelerationJerkMagnitude-mean()", "The mean magnitude of the jerk acceleration of the body in time domain", explanation,fixed = TRUE)
      explanation <- gsub("tBodyAccelerationJerkMagnitude-std()", "The standard deviation of  magnitude of the jerk acceleration of the body in time domain", explanation,fixed = TRUE)
      
      explanation <- gsub("tBodyGyroscopeMagnitude-mean()", "The mean magnitude of the gyroscope of the body in time domain", explanation, fixed = TRUE)
      explanation <- gsub("tBodyGyroscopeMagnitude-std()", "The standard deviation of the magnitude of the gyroscope of the body in time domain", explanation, fixed = TRUE)
      
      explanation <- gsub("tBodyGyroscopeJerkMagnitude-mean()", "The mean magnitude of the gyroscope jerk of the body in time domain", explanation, fixed = TRUE)
      explanation <- gsub("tBodyGyroscopeJerkMagnitude-std()", "The standard deviation of the magnitude of the gyroscope jerk of the body in time domain", explanation, fixed = TRUE)
      
      
      
      
      ############################################################################
      ## Frequency domain
      ############################################################################
      explanation <- gsub("fBodyAcceleration-mean", "The mean acceleration of body in frequency domain, in direction X/Y/Z", explanation)
      explanation <- gsub("fBodyAcceleration-std", "The standard deviation of acceleration of body in frequency domain, in direction X/Y/Z", explanation)
      
      explanation <- gsub("fBodyAccelerationJerk-mean", "The mean jerk acceleration of the body in frequency domain, in direction X/Y/Z", explanation)
      explanation <- gsub("fBodyAccelerationJerk-std", "The standard deviation of jerk acceleration of the body in frequency domain, in direction X/Y/Z", explanation)
      
      explanation <- gsub("fBodyGyroscope-mean", "The mean gyroscope of the body in frequency domain, in direction X/Y/Z", explanation)
      explanation <- gsub("fBodyGyroscope-std", "The standard deviation of gyroscope of the body in frequency domain, in direction X/Y/Z", explanation)
      
  
      explanation <- gsub("fBodyAccelerationMagnitude-mean()", "The mean magnitude of the acceleration of the body in frequency domain", explanation,fixed = TRUE)
      explanation <- gsub("fBodyAccelerationMagnitude-std()", "The standard deviation of  magnitude of the acceleration of the body in frequency domain", explanation,fixed = TRUE)
      
      explanation <- gsub("fBodyBodyAccelerationJerkMagnitude-mean()", "The mean magnitude of the jerk acceleration of the body in frequency domain", explanation,fixed = TRUE)
      explanation <- gsub("fBodyBodyAccelerationJerkMagnitude-std()", "The standard deviation of  magnitude of the jerk acceleration of the body in frequency domain", explanation,fixed = TRUE)
      
      explanation <- gsub("fBodyBodyGyroscopeMagnitude-mean()", "The mean magnitude of the gyroscope of the body in frequency domain", explanation, fixed = TRUE)
      explanation <- gsub("fBodyBodyGyroscopeMagnitude-std()", "The standard deviation of the magnitude of the gyroscope of the body in frequency domain", explanation, fixed = TRUE)
      
      explanation <- gsub("fBodyBodyGyroscopeJerkMagnitude-mean()", "The mean magnitude of the gyroscope jerk of the body in frequency domain", explanation, fixed = TRUE)
      explanation <- gsub("fBodyBodyGyroscopeJerkMagnitude-std()", "The standard deviation of the magnitude of the gyroscope jerk of the body in frequency domain", explanation, fixed = TRUE)
      

      ############################################################################
      ## Labels
      ############################################################################
      
      explanation <- gsub("Activity", "The activity of the users, one of: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING", explanation)
      explanation <- gsub("Subject", "Index of the user, ranges from 1 to 30", explanation)
      

      
      
      codebook <- paste("* ",unique(descrip),"\n",unique(explanation),"\n")
      
      write.table(codebook, "CodeBook.md", quote = FALSE, row.names = FALSE, col.names = FALSE)
}
