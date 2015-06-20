# General Information



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