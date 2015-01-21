# Data Science Course 3 -- Getting and Cleaning Data
# Course Programming Project


library(stringr)
library(reshape2)

# set up the directory structure -- only the first line would need to be changed if we move the whole thing
# the submission is based on the assumption that the working directory is UCI HAR Dataset 
# the directory was created when the files were unzipped
datadir <- "."
testdir <- paste(datadir, "/test", sep = "")
traindir <- paste(datadir, "/train", sep = "")

# information common to Test and Training
# activity labels -- all we use this file for is to ensure that our labels are in the right order
activity.Levels <- read.table(paste(datadir, "/activity_labels.txt", sep = ""), stringsAsFactors = FALSE)
activity.Levels
activity.Labels <- c("Walking", "Walking Upstairs", "Walking Downstairs", "Sitting", "Standing", "Laying")
rm(activity.Levels) # now that we have looked at the file we don't need it any more

# features -- i.e. the meaning of the various columns -- will use these as the basis of column names
features <- read.table(paste(datadir, "/features.txt", sep = ""), colClasses = "character")
# make valid column names -- minimize typing
goodnames <- make.names(features[[2]])
# now all the column names are valid R names -- will work a bit harder on the columns we are going to keep
# some packages (e.g. SQL) don't like dots in variable names -- so replace with underscores
# kill trailing underscores also
goodnames <- str_replace_all(goodnames, fixed("."), "_")
goodnames <- str_replace_all(goodnames, fixed("___"), "_")
goodnames <- str_replace_all(goodnames, fixed("mean__"), "mean")
goodnames <- str_replace_all(goodnames, fixed("std__"), "std")
goodnames <- str_replace_all(goodnames, fixed("BodyBody"), "Body")

# per assignment instructions, will want to keep only some columns
columnstokeep <- c(1:6, 41:46, 81:86, 121:126, 161:166, 201:202, 214:215, 227:228, 240:241, 
                   253:254, 266:271, 345:350, 424:429, 503:504, 529:530, 542:543)


# parallel processing for Test and Training
# for only two groups it hardly seems worth the trouble to write a function 
# subjects
subjects.Test <- read.table(paste(testdir, "/subject_test.txt", sep = ""))
subjects.Train <- read.table(paste(traindir, "/subject_train.txt", sep = ""))
# there is no overlap in subject numbers between Test and Training
# for purposes of this assignment it wouldn't matter if there were overlap


# activities
# the name Y_test is highly misleading -- shame on UCI
activities.Test <- read.table(paste(testdir, "/Y_test.txt", sep = ""))
activities.Train <- read.table(paste(traindir, "/Y_train.txt", sep = ""))

# results
results.Test <- read.table(paste(testdir, "/X_test.txt", sep = ""), col.names = goodnames)
# chop down to the columns we want
results.Test <- results.Test[, columnstokeep]
# bring in the subjects and the activities
# the input result file had no link field, so we are totally hostage to the order of the rows
# if there had been a link field we would use merge in preference to cbind
results.Test <- cbind(subjects.Test, activities.Test, results.Test)
names(results.Test)[1] <- "Subject"
names(results.Test)[2] <- "Activity"

results.Train <- read.table(paste(traindir, "/X_train.txt", sep = ""), col.names = goodnames)
# chop down to the columns we want
results.Train <- results.Train[, columnstokeep]
# bring in the subjects and the activities
results.Train <- cbind(subjects.Train, activities.Train, results.Train)
names(results.Train)[1] <- "Subject"
names(results.Train)[2] <- "Activity"

#all together
results <- rbind(results.Train, results.Test)
# prepare to pretty print the activities
results[[2]] <- factor(results[[2]], labels = activity.Labels)
# Now results has satisfied specs 1 - 4 of the assignment

# clean up memory before doing the actual analysis
rm(activities.Test, activities.Train, activity.Labels, columnstokeep, features, goodnames, results.Test, 
   results.Train, subjects.Test, subjects.Train)

# analysis uses the reshape2 package
resultsmelt <- melt(results, id = c("Subject", "Activity")) # will make all the rest measurement variables

answer <- dcast(resultsmelt, Subject + Activity ~ variable, mean) 
write.table(answer, file = paste(datadir, "/answers.txt", sep = ""), sep = ",", row.names = FALSE)
# answers.txt is the file to be uploaded
##############################################################################################
# code to read the file back
# answerback <-read.table(paste(datadir, "/answers.txt", sep = ""), sep = ",", header = TRUE)
# the table read back is identical to the original table, with two exceptions
#   the numeric values inevitably lost some precision, but are the same as measured by the all.equal() function
#   the numeric coding for the Activity factor is now alphabetical
#############################################################################################
