################################################################################
#
#   Please read the README file for detailed information
#
################################################################################

################################################################################
##  obtain data (download and unzip)
################################################################################
obtain_data <- function(){
    
    fileUrl <- paste0("https://d396qusza40orc.cloudfront.net/",
                      "getdata%2Fprojectfiles%2FUCI%20HAR%20",
                      "Dataset.zip")
    
    download.file(fileUrl, destfile="UCI_HAR_DATASET.zip")
    
    unzip("UCI_HAR_DATASET.zip")
    
}
   
################################################################################
##  prepare data (this function can be excuted for training and test data)
################################################################################
prepare_data <- function(x, features, activities){
    
#   set relative paths
    sub.dir <- paste0("./UCI HAR Dataset/")

    s.path <- paste0(sub.dir, x, "/", "subject_", x, ".txt")
    X.path <- paste0(sub.dir, x, "/", "X_", x, ".txt")
    y.path <- paste0(sub.dir, x, "/", "y_", x, ".txt")

#   prepare subject data
    s.data <- fread(input = s.path, data.table = TRUE, )
    setnames(s.data, "Subject.ID")

#   prepare X and y data, fread doesn't work
#   selecting X.data on means and standard deviations
    X.data <- as.data.table(read.table(X.path)[, features$Feature.ID])
    setnames(X.data, features$Feature.Label)   

    y.data <- as.data.table(read.table(y.path))
    setnames(y.data, "Activity.ID")

#   combine data and labels

    #   X.data (measurements) and subjects
        X.data[, Subject.ID:=s.data$Subject.ID]
    
    #   adding activities
        X.data[, Activity:=factor(y.data$Activity.ID,
                                  levels=activities$Activity.ID, 
                                  labels=activities$Activity.Label)]
    
    #   reorder columns
        setcolorder(X.data, c("Activity", 
                              setdiff(names(X.data), "Activity")))
        setcolorder(X.data, c("Subject.ID", 
                              setdiff(names(X.data), "Subject.ID")))
    
}

################################################################################
##  run_analysis
################################################################################
run_analysis <- function(download=TRUE){
    
#   library
    if(require("data.table")){
        print("Package data.table is loaded correctly!")
    } else {
        print("Trying to install package data.table!")
        install.packages("data.table")
        if(require(data.table)){
            print("Package data.table installed and loaded!")
        } else {
            stop("Could not install package data.table!")
        }
    }

#   obtain data (download and unzip)
    if(download==TRUE){obtain_data()}
    
#   prepare labels

    #   set relative paths
        sub.dir <- paste0("./UCI HAR Dataset/")
        
        f.path <- paste0(sub.dir, "features.txt")
        a.path <- paste0(sub.dir, "activity_labels.txt")
    
    #   features
    
        #   load features and set names
            features <- fread(f.path, data.table = TRUE)
            setnames(features, c("Feature.ID","Feature.Label"))
            
        #   subset features
            features <- subset(features, 
                               grepl("(mean|std)[()]",
                                     features$Feature.Label))
    
        #   make features more readable
            features[, 2:=gsub("^t", "time.", features$Feature.Label)]
            features[, 2:=gsub("^f", "frequency.", features$Feature.Label)]
            features[, 2:=gsub("BodyBody", "Body", features$Feature.Label)]
            features[, 2:=gsub("-", ".", features$Feature.Label)]
            features[, 2:=gsub("[(][)]", "", features$Feature.Label)]
    
    #   activities              
    
        #   load activities and set names
            activities <- fread(a.path, data.table = TRUE)
            setnames(activities, c("Activity.ID", "Activity.Label"))
            
        #   make activities more readable
            activities[, 2:=gsub("_", ".", activities$Activity.Label)]

#   prepare data (using the prepare_data function) 
    train.data <- prepare_data("train", features, activities)
    test.data <- prepare_data("test", features, activities)
    
    tidy.data <- rbindlist(list(train.data, test.data))
    
    aggregate.data <- tidy.data[, lapply(.SD, mean), by=list(Subject.ID, Activity)]
    aggregate.data <- aggregate.data[order(Subject.ID, Activity)]
    
#   export data
    write.table(aggregate.data, "./TidyData.txt", row.names = FALSE, quote = FALSE)
    write.table(tidy.data, "./TidyData.csv", quote = FALSE)

#   return aggregate data
    aggregate.data
    
}