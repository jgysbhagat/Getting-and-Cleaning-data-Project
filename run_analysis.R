train_data=read.table("UCI HAR Dataset/train/X_train.txt",header = F)
test_data=read.table("UCI HAR Dataset/test/X_test.txt",header = F)
full_data=as.data.frame(rbind(train_data,test_data))
y_train=read.table("UCI HAR Dataset/train/y_train.txt",header=F)
y_test=read.table("UCI HAR Dataset/test/y_test.txt",header = F)
y_all=rbind(y_train,y_test)
#Giving variable names
var_names=read.table("UCI HAR Dataset/features.txt",header=F)
colnames(full_data)=var_names[,2]
#Extracting columns containing mean and standard deviation
full_data_dup=full_data[,!duplicated(colnames(full_data))]
mean_std=select(full_data_dup,contains("mean()"),contains("std()"))
 #Adding activity labels               
labels=read.table("UCI HAR Dataset/activity_labels.txt",header=F)
y_all_labels=left_join(y_all,labels,by="V1")
colnames(y_all_labels)=c("y","labels")
#Change variable names
mean_std_labels=as.data.frame(cbind(mean_std,y_all_labels$labels))
names(mean_std_labels)=gsub("\\()","",names(mean_std_labels))
names(mean_std_labels)=gsub("^t","time-",names(mean_std_labels))
names(mean_std_labels)=gsub("^f","frequency-",names(mean_std_labels))
names(mean_std_labels)=gsub("Acc","Acceleration",names(mean_std_labels))
names(mean_std_labels)=gsub("Gyro","Gyroscope",names(mean_std_labels))
names(mean_std_labels)=gsub("Mag","Magnitude",names(mean_std_labels))
names(mean_std_labels)=gsub("std","StandardDeviation",names(mean_std_labels))
colnames(mean_std_labels)[67]="ActivityLabels"
subject_train=read.table("UCI HAR Dataset/train/subject_train.txt",header=F)
subject_test=read.table("UCI HAR Dataset/test/subject_test.txt",header=F)
subjects=rbind(subject_train,subject_test)
#Full Data set
mean_std_labels$subjects=subjects$V1
#Q-5
average_variables_data=mean_std_labels%>%
    group_by(subjects,ActivityLabels)%>%
    summarise_each(funs(mean))
write.table(average_variables_data,"Average Variables data",row.names = F)
