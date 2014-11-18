##run_analysis.R - R script for cleaning the UCI HAR Dataset
#Remember to set your Working Directory before beginning the file download

#The following script sets the URL path for the UCI .zip file, downloads the file, and unzips  it to
#a subfolder in the working directory called "CourseProject"
fileUrl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl,destfile="./CourseProject.zip")
unzip("./CourseProject.zip",exdir="./CourseProject")

#The UCI HAR Dataset is broken into 2 datasets - the training data and the test data.  The following
#script downloads all corresponding files into a training data frame and a test data frame, then combines
#them into a full dataset.
subj.train = read.table("./CourseProject/UCI HAR Dataset/train/subject_train.txt")
x.train = read.table("./CourseProject/UCI HAR Dataset/train/X_train.txt")
y.train = read.table("./CourseProject/UCI HAR Dataset/train/y_train.txt")

subj.test = read.table("./CourseProject/UCI HAR Dataset/test/subject_test.txt")
x.test = read.table("./CourseProject/UCI HAR Dataset/test/X_test.txt")
y.test = read.table("./CourseProject/UCI HAR Dataset/test/y_test.txt")

train.data<-data.frame(subj.train,x.train,y.train)

test.data<-data.frame(subj.test,x.test,y.test)

full.data<-rbind(train.data,test.data)

#The labels for the Activity levels and the features is loaded into R.
activ.lab = read.table("./CourseProject/UCI HAR Dataset/activity_labels.txt")
features = read.table("./CourseProject/UCI HAR Dataset/features.txt")

#The following pulls out the 2nd column from each of the above objects and converts each to a
#character vector, to later be used as labels
activ.lab<-as.character(activ.lab[,2])
features<-as.character(features[,2])

#Replaces the "-" with a "." to aid in later analysis, where the "-" may be confused as a 'minus' as in
#a mathematical equation
features<-gsub("-",".",features)

#The new column names can now be assigned using the newly created 'features' character vector
colnames(full.data)<-c("ID",features,"Activity")

#Before the Activity lables can be assigned, the Activity column must first be converted into a factor
#variable.  Then the levels are assigned to the newly created 'activ.lab' character vector
full.data$Activity <- factor(full.data$Activity)
levels(full.data$Activity)<-activ.lab

#The data sort is now re-ordered based on (1) ID and (2) type of Activity.
full.data<-full.data[order(full.data$ID,full.data$Activity),]

#The following scripts pulls out only the columns of interest, specifically the features that measure the
#mean and standard deviation for each measurement.
x.subset<-grepl("mean()|std()",colnames(full.data)) #The grepl() function pulls out specific columns
x.subset<-full.data[,x.subset] #The full dataset is subsetted with this new index
x.subset<-x.subset[,-c(47:49,56:58,65:67,70,73,76,79)] #There are a few additional columns that still end
#up in our dataset because they have the name 'mean' in them.  These are removed here.
sub.names<-as.character(colnames(x.subset)) #A new character vector for column names is created here.

full.data<-cbind(full.data$ID,x.subset,full.data$Activity) #The full dataset is updated with the new
#subset of the data
colnames(full.data)<-c("ID",sub.names,"Activity") #The column names are updated with the new feature names
rownames(full.data)<-1:10299 #For convenience, the row names are reassigned to reflect the new order of
#the dataset

library(dplyr) #dplyr is called for the final segment
df<-tbl_df(full.data) #The full dataset is converted into a table in order to work with 'dplyr'

#The following chain first groups the data by ID and then Activity, and secondly, summarizes this grouped
#data to get the mean for each ID for each Activity.
final.data<-df%>%
  group_by(ID,Activity)%>%
  summarise_each(funs(mean))

#The data is converted back into a data frame
final.data<-data.frame(final.data)

#The final data is written to a .txt file that saved in the original "CourseProject" directory.
write.table(final.data,file="./CourseProject/tidyData.txt",row.names=FALSE)