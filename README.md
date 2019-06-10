# Clean_Data
Week 4 Project of Getting and Cleaning Data


This project uses the following files from Smartlab

- 'features.txt': List of all features.
- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.
- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 


# The Script and New Data

The new data is combined into one file, and is constructed by the following steps

1) Merging the test and training data for each of the three relevant sets using rbind:
- X_train and X_test (the primary data sets / observations) into a table called "set"
- y_train and y_test (the labels relating to the code for the activity in the observation) into a table called "labels"
- subject_train and subject_test (the labels relating to the subject of each observation) into a table caled "subject"

2) Renamed Columns for clarity and consistency
- activity table was given column names for the "Activity_Code" and the "Activity"
- labels table was given column name "Activity_Code" for matching to the activity table
- subject table was given the column name "Subject"
- set table was given the names from the features table

3) Combine files
- Using merge, added the descriptive text to match the detailed activity code for each record
- Using cbind, added Activty and Subject as the first two columns of a dataset - where the remaining columns were the detailed measurements of each observation

4) Using the names of each data column, kept only the columns related to Activity & Subject - plus all columns with either [Ss]td or [Mm]ean in the name.

5) Created a Summary file that includes the file from step 4, summarized to be the mean of each Activity & Subject combination.
