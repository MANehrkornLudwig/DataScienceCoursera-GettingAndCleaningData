# General Information

run_analysis.R performs the following tasks in order to create a tidy data set based on Samsung smartphone data provided by Anguita, Ghio, Oneto, Parra and Reyes-Ortiz (2012):

* It downloads the Samsung smartphone data if necessary.
* It merges the training and the test datasets to create one data set.
* It extracts only the measurements on the mean and standard deviation for each measurement (for further details see the codebook).
* It applies descriptive activity names the activities in the data set
* It appropriately labels the data set with descriptive variable names.

In addition to that, it creates a second tidy data set with the average of each variable for each activity and each subject. This data set is returned by "run_analysis".

The script provides a function to download the data if necessary ("obtain_data"). 
Training and test datasets are individually prepared by the "prepare_data" function. This includes (1) loading the data sets, (2) labelling the variables, (3) selecting data on means and standard deviations, (4) combining data sets (data set identifying the subject, feature data, activities) and (5) and labelling variables if necessary.

Both function are called by the "run_analysis" function. In addition to that, the function prepares variable (features) as well as value (activities) labels, merges processed training and test data, calculates the average of each variable for each activity and each subject, and exports the resulting tidy datasets.


# Running run_analysis.R

run_analysis either downloads the data and extracts the zip file to
a subfolder of the current working directory which is called "UCI HAR
Dataset" (argument "download" = TRUE (default)) or assumes that the
data has already been downloaded and extracted to the aforementioned
folder.

The procedure to obtain the data is defined in the function "obtain_data".
This function is called by "run_analysis" if the download argument is set to
TRUE.

While feature and activity labels are loaded and modified in run_analysis,
the measurement data is processed by the prepare_data function which can 
be applied to training as well as test data. prepare_data is called by 
run_analysis.

run_analysis makes use of the "data.table" package. If this package is not
installed, it will be installed and loaded.