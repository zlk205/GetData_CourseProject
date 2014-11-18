##run_analysis.R - R script for cleaning the UCI HAR Dataset
#Remember to set your Working Directory before beginning the download
#See the README.md for additional notes on the following scripts

fileUrl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl,destfile="./CourseProject.zip")
unzip("./CourseProject.zip",exdir="./CourseProject")

subj.train = read.table("./CourseProject/UCI HAR Dataset/train/subject_train.txt")
x.train = read.table("./CourseProject/UCI HAR Dataset/train/X_train.txt")
y.train = read.table("./CourseProject/UCI HAR Dataset/train/y_train.txt")

subj.test = read.table("./CourseProject/UCI HAR Dataset/test/subject_test.txt")
x.test = read.table("./CourseProject/UCI HAR Dataset/test/X_test.txt")
y.test = read.table("./CourseProject/UCI HAR Dataset/test/y_test.txt")

train.data<-data.frame(subj.train,x.train,y.train)
test.data<-data.frame(subj.test,x.test,y.test)
full.data<-rbind(train.data,test.data)

activ.lab = read.table("./CourseProject/UCI HAR Dataset/activity_labels.txt")
features = read.table("./CourseProject/UCI HAR Dataset/features.txt")

activ.lab<-as.character(activ.lab[,2])
features<-as.character(features[,2])

features<-gsub("-",".",features) #Replaces the "-" with a "." to aid in further analysis
colnames(full.data)<-c("ID",features,"Activity")

full.data$Activity <- factor(full.data$Activity)
levels(full.data$Activity)<-activ.lab

full.data<-full.data[order(full.data$ID,full.data$Activity),]

x.subset<-grepl("mean()|std()",colnames(full.data))
x.subset<-full.data[,x.subset]
x.subset<-x.subset[,-c(47:49,56:58,65:67,70,73,76,79)]
sub.names<-as.character(colnames(x.subset))

full.data<-cbind(full.data$ID,x.subset,full.data$Activity)
colnames(full.data)<-c("ID",sub.names,"Activity")
rownames(full.data)<-1:10299

library(dplyr)
df<-tbl_df(full.data)

final.data<-df%>%
  group_by(ID,Activity)%>%
  summarise_each(funs(mean))

final.data<-data.frame(final.data)

write.table(final.data,file="./CourseProject/tidyData.txt",row.names=FALSE)