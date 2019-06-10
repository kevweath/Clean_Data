## First, load thh data to data tables

## Load the common files
activity<-read.table("UCI HAR Dataset/activity_labels.txt")
features<-read.table("UCI HAR Dataset/features.txt")

## Load the test files
subject_test<-read.table("UCI HAR Dataset/test/subject_test.txt")
set_test<-read.table("UCI HAR Dataset/test/X_test.txt")
labels_test<-read.table("UCI HAR Dataset/test/y_test.txt")

## Load the training files
subject_train<-read.table("UCI HAR Dataset/train/subject_train.txt")
set_train<-read.table("UCI HAR Dataset/train/X_train.txt")
labels_train<-read.table("UCI HAR Dataset/train/y_train.txt")

## Merge Test and Training Data -- maintaining columns and appending rows
subject<-rbind(subject_test,subject_train)
set<-rbind(set_test,set_train)
labels<-rbind(labels_test,labels_train)

## Rename Columns for clarity and consistency
names(activity)<-c("Activity_Code","Activity")
names(subject)<-"Subject"
names(labels)<-"Activity_Code"
names(set)<-features$V2

## Merge activity codes with activity labels
activity<-merge(labels,activity)

## Combine all data for each observations
data<-cbind(Activity=activity[,2],subject,set)

## Extract only the measurements on mean and std
stdv<-grepl("[Ss]td",names(data))
mean<-grepl("[Mm]ean",names(data))
keep<-stdv|mean

## Also keep first two columns
keep[1]<-TRUE
keep[2]<-TRUE

data<-data[,keep]

## Create Summary Table
Summary<-aggregate(data[,3:88],list(Activity=data[,1],Subject=data[,2]),mean)
View(Summary)
write.table(Summary,"Summary",row.names = FALSE)
