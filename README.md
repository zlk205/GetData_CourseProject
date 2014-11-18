#README file for 'run_analysis.R'

The following is a description of the 'run_analysis.R' script which is used to clean and tidy the
"Human Activity Recognition Using Smartphones" (HAR) Data Set which is found on the UCI Machine Learning
Repository.

[More information on the HAR Data Set can be found here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

[The HAR Data Set can be downloaded as a .ZIP file here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)


##Working with the 'run_analysis.R' script

Prior to running any of the scripts from this file, *remember to set your Working Directory!*

The following script sets the URL path for the HAR .zip file, downloads the file, and unzips it to
a subfolder in the working directory called "CourseProject".  Please note, all MAC users must add
method="curl" to the download.file() arguments list.  Also, please note, the unzip() function may take
up to 10 minutes to unzip all the files into the appropriate folders.  To save time, you can skip this 
step in the script and manually unzip the files into the "CourseProject" subfolder.
    
    fileUrl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
    download.file(fileUrl,destfile="./GetData_CourseProject.zip")
    unzip("./CourseProject.zip",exdir="./CourseProject")

The UCI HAR Dataset is broken into 2 datasets - the training data and the test data.  The following
script downloads all corresponding files into a training data frame and a test data frame, then combines
them into a full dataset.
    
    subj.train = read.table("./CourseProject/UCI HAR Dataset/train/subject_train.txt")
    x.train = read.table("./CourseProject/UCI HAR Dataset/train/X_train.txt")
    y.train = read.table("./CourseProject/UCI HAR Dataset/train/y_train.txt")

    subj.test = read.table("./CourseProject/UCI HAR Dataset/test/subject_test.txt")
    x.test = read.table("./CourseProject/UCI HAR Dataset/test/X_test.txt")
    y.test = read.table("./CourseProject/UCI HAR Dataset/test/y_test.txt")

    train.data<-data.frame(subj.train,x.train,y.train)

    test.data<-data.frame(subj.test,x.test,y.test)

    full.data<-rbind(train.data,test.data)

The labels for both the types of activities recorded and the types of measurements recorded on each
activity (referred to as 'features') are loaded into R.
    
    activ.lab = read.table("./CourseProject/UCI HAR Dataset/activity_labels.txt")
    features = read.table("./CourseProject/UCI HAR Dataset/features.txt")

The following script pulls out the 2nd column (the only column of interest) from each of the above objects and converts each to a character vector which will later be used to assign labels.
    
    activ.lab<-as.character(activ.lab[,2])
    features<-as.character(features[,2])

Since the feature labels contain the "-" character, the following script replaces the "-" with a "." character. This will aid in later analysis, since R may interpret  the "-" as a 'minus' as in a mathematical equation.
    
    features<-gsub("-",".",features)

The new column names for the full dataset can now be assigned using the newly created 'features' character vector.
    
    colnames(full.data)<-c("ID",features,"Activity")

Before the activity labels can be assigned, the "Activity" column must first be converted into a factor
variable.  Then the levels are assigned using the newly created 'activ.lab' character vector.
    
    full.data$Activity <- factor(full.data$Activity)
    levels(full.data$Activity)<-activ.lab

The data sort is now re-ordered based on (1) the participant ID and (2) the type of activity.
    
    full.data<-full.data[order(full.data$ID,full.data$Activity),]

The following script pulls out only the columns of interest, specifically the features that measure the
mean and standard deviation for each measurement (or feature). The grepl() function is used to pull out
columns that contain "mean()" or "std()" in the column name. Then the full dataset is subsetted with this newly created index.  Before continuing, the grepl() function has inadvertently grabbed a few other column names with "mean" in the title.  The next line of script removes the extra unwanted columns. Finally, a new character vector for the subsetted column names is created.
    
    x.subset<-grepl("mean()|std()",colnames(full.data))
    x.subset<-full.data[,x.subset]
    x.subset<-x.subset[,-c(47:49,56:58,65:67,70,73,76,79)]
    sub.names<-as.character(colnames(x.subset))

The full dataset is updated with the new subset of columns created in the previous script. The column names are updated to reflect the subset of column names that were just created.  And for clarity, the row names will be reset to match up with the new order of the data, where ID #1 now corresponds to row 1 and so forth.
    
    full.data<-cbind(full.data$ID,x.subset,full.data$Activity)
    colnames(full.data)<-c("ID",sub.names,"Activity")
    rownames(full.data)<-1:10299

The 'dplyr' package is now called in for the final segment.  *Note: If user has not already done so, use 'install.packages("dplyr")' now load the 'dplyr' package.*  The full dataset is then converted to a table
in order to work with the data using 'dplyr'.
    
    library(dplyr)
    df<-tbl_df(full.data)

The following chained command first groups the data by ID and Activity, and secondly, summarizes this grouped
data to get the mean for each ID for each Activity.
    
    final.data<-df%>%
      group_by(ID,Activity)%>%
      summarise_each(funs(mean))

The data is converted back into a data frame
    
    final.data<-data.frame(final.data)

The final data is written to a .txt file that is saved in the original "CourseProject" directory.
    
    write.table(final.data,file="./CourseProject/tidyData.txt",row.names=FALSE)