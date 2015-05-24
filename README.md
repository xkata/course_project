# course_project
##ReadMe
##Functions
##Required Packages
##How To Run Script
 
The run_analysis script is composed of 5 functions. Each of these functions
play role in extracting and eventually returning a tidy dataset.
###Functions
####mergeData()
Merges Test and Training Data and returns a data frame
The data frame will have all columns labelled as well

####filterData()
Filters out, measurements that are not required in the Tidy dataset. 
Only Standard Deviation and Mean measurements are preserve, 
other measurements are discarded. 
Returns data.frame

####DescriptiveNaming()
Renames columns with non-descriptive names. Activity column's 
numeric rows are replaced with character equivalents. 
* 1 WALKING
* 2 WALKING_UPSTAIRS
* 3 WALKING_DOWNSTAIRS
* 4 SITTING
* 5 STANDING
* 6 LAYING



####tidyData()
Returns a data.frame with Averages of every measurement grouped by subject and activity, the tidy data.
It also write the result to the current working directory
####run_analysis()
This is the entry point to the script, it will call every other function in sequence to return a tidy data.frame
###Required Packages()
dplyr package is required to run this script
###How to Run Script()
Download and extract dataset
Load script using source function
```
>source("run_analysis.R")
```
Navigate to dataset directory and execute function run_analysis
```
>run_analysis()
```
or
Pass run_analysis the location of the extracted dataset
```
>run_analysis("/extracted_dataset_directory")
```
The function will return a tidy dataset and write the data set to file "tidy_data.txt"
