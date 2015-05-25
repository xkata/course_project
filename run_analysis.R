#merges test and training data
#activity and subjects are included for training and test data
#returns data.frame 
mergeData <- function()
{
  
  columun_names <- read.table("features.txt")
  test_data_subjects <- read.table("test/subject_test.txt")
  test_data_x_axis <- read.table("test/X_test.txt")
  test_data_y_axis <- read.table("test/y_test.txt")
  
  training_data_subjects <- read.table("train/subject_train.txt")
  training_data_x_axis <-read.table("train/X_train.txt")
  training_data_y_axis <-read.table("train/y_train.txt")
  
  complete_test_data <- cbind(test_data_subjects,test_data_y_axis,test_data_x_axis)
  complete_training_data <- cbind(training_data_subjects,training_data_y_axis,training_data_x_axis)
  merged_data_set <- rbind(complete_test_data,complete_training_data)
  colnames(merged_data_set) <-c("subject","activity", as.vector(columun_names[,2]))
  merged_data_set
}
#filters data set, getting only standard deviation and mean measures from the merged data
#returns data frame
filterData <- function(merged_data_set)
{
  grep('*mean*|*std*', names(merged_data_set))
  filtered_data <- merged_data_set[,c(1,2,grep('*mean*|*std*', names(merged_data_set) ))]
}	

#Renames non descriptive columns 
#Renames activities from numeric representation to string/character equivalents
#returns data.frame 
DescriptiveNaming <-function(filtered_data_set)
{
  library(dplyr)
  column_names <- colnames(filtered_data_set)
  column_names<-gsub("f","FreqOf",column_names)
  column_names<-gsub("tB","TimeOfB",column_names)
  column_names<-gsub("tG","TimeOfG",column_names)
  column_names<-gsub("Mag","Magnitude",column_names)
  colnames(filtered_data_set)<-column_names
  #rename activities from numeric values to character/string eqivalents
  renameActivities <- function(x)
  {
    activityMap <-c('WALKING', 'WALKING_UPSTAIRS', 'WALKING_DOWNSTAIRS', 'SITTING', 'STANDING', 'LAYING')
    activityMap[x] 
  }
  dplyr::mutate(filtered_data_set,activity=renameActivities(activity))
  
}
#Groups data by subject and activity 
#Create a data.frame with mean values of mean & std for each subject grouped by activity
#A data set is written to local disk in the UCI HAR Dataset directory
tidyData <- function(complete_data_set)
{
  by_subject_activity <- complete_data_set %>% group_by(subject,activity)
  tidy_data<-by_subject_activity %>% dplyr::summarise_each(funs(mean))
  write.table(tidy_data,"tidy_data")
  tidy_data
}
#Return tidy Data, calling required function at each stage of the process

run_analysis <- function(data_set_location='.')
{
  #Script Assumes data set is downloaded and extracted
  #Script should executed in "UCI HAR Dataset" directory or location of "UCI HAR Dataset" directory is passed to data_set_location
  setwd(data_set_location)
  merged_data<-mergeData()
  filtered_data<-filterData(merged_data)
  complete_data<-DescriptiveNaming(filtered_data)
  tidyData(complete_data)
}
