# getting_cleaning_in_R_programing_assignment
This repository was created to maintain code and relevant materials for programming assignments in the course 'Getting and Cleaning Data'.

## Data source


The data were collected from the accelerometer and gyroscope in a mobile phone by 30 example users who performed 6 activities. The original data from the course had 561 features, but we filtered only the features name that contain the words "mean()" and "std()". Then, we merged the training and testing data of the features and labels into one DataFrame.

## Cleaning step 

The course instructions show 5 steps, but in my code, I split it into 7 steps that is 

1. merge train and test data.
2. select only feature names with the words "mean()" "std()" by using reg-ex.
3. set feature, label and subject column name.
4. merge feature, label and subject columns to a DataFrame.
5. set class of labels and subjects to categorical(factor).
6. group by subject then activity column (aggregate with mean).
7. write final data file.
