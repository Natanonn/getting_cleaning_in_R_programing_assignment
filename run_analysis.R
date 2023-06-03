# load relevant libraries
library(dplyr) 
library(data.table)

# Step 0 read all train and test data
X_train <- read.table("UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("UCI HAR Dataset/train/y_train.txt")
subject_train <-  read.table("UCI HAR Dataset/train/subject_train.txt") # the people who do that activity

X_test <- read.table("UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("UCI HAR Dataset/test/y_test.txt")
subject_test <-  read.table("UCI HAR Dataset/test/subject_test.txt")

features_name_all <- read.table("UCI HAR Dataset/features.txt")

# Step 1 merge train and test data
X_all <- rbind(X_train, X_test)
y_all <- rbind(y_train, y_test)
subject_all <- rbind(subject_train, subject_test)

# Step 2 select only feature names with the words "mean()" "std()" by using reg-ex
selected_features_index <- grep("mean\\(\\)|std\\(\\)",features_name_all[,2])
selected_features_name <- grep("mean\\(\\)|std\\(\\)",features_name_all[,2],value=TRUE)
X_all <-X_all[, selected_features_index]

# Step 3 set feature, label and subject column name
colnames(X_all) <- selected_features_name
colnames(y_all) <- "activity"
colnames(subject_all) <- "subject"

# Step 4 merge feature, label and subject columns to a DataFrame
total_df <- cbind(subject_all, X_all, y_all)

# Step 5 set class of labels and subjects to categorical(factor)
total_df$activity <-as.factor(total_df$activity)
total_df$subject <-as.factor(total_df$subject)

# Step 6 group by subject then activity column (aggregate with mean)
summarised_by_mean_df <- total_df %>% group_by(subject, activity) %>%  summarize_all(mean)

# Step 7 write final data file

write.table(summarised_by_mean_df, file = "./tidydata.txt", row.names = FALSE, col.names = TRUE) 
