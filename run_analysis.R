#####################---Question_1---#####################
features <- read.csv("./UCI HAR Dataset/features.txt",header = FALSE, sep=" ")
features <- as.character(features[,c("V2")])

xTrainData <- read.table("./UCI HAR Dataset/train/X_train.txt")
yTrainData <- read.csv("./UCI HAR Dataset/train/y_train.txt", header = FALSE)
subjectData <- read.csv("./UCI HAR Dataset/train/subject_train.txt", header = FALSE)

trainData <- data.frame(subjectData,yTrainData, xTrainData)
names(trainData) <- c(c("subject","activity"),features)

xTestData <- read.table("./UCI HAR Dataset/test/X_test.txt")
yTestData <- read.csv("./UCI HAR Dataset/test/y_test.txt", header = FALSE)
subjectTestData <- read.csv("./UCI HAR Dataset/test/subject_test.txt", header = FALSE)

testData <- data.frame(subjectTestData,yTestData, xTestData)
names(testData) <- c(c("subject","activity"),features)

completeData <- rbind(testData, trainData)

#####################---Question_2---#####################
meanTable <- completeData[,c(grepl("mean", names(completeData)))]
stdTable <- completeData[,c(grepl("std", names(completeData)))]

mean_std_table <- cbind(completeData[,c(1,2)],meanTable,stdTable)

#####################---Question_3---#####################
activity_label <- read.csv("./UCI HAR Dataset/activity_labels.txt",header = FALSE, sep = " ")
activity_label <- as.character(activity_label[,c("V2")])

mean_std_table$activity <- activity_label[mean_std_table$activity]

#####################---Question_4---#####################
names(mean_std_table) <- gsub("[()]","",names(mean_std_table))
names(mean_std_table) <- gsub("Acc","Accelerator",names(mean_std_table))
names(mean_std_table) <- gsub("Gyro","Gyroscope",names(mean_std_table))
names(mean_std_table) <- gsub("Mag","Magnitude",names(mean_std_table))
names(mean_std_table) <- gsub("std","standard_deviation",names(mean_std_table))
names(mean_std_table) <- gsub("^t","Time-",names(mean_std_table))
names(mean_std_table) <- gsub("^f","Frequency-",names(mean_std_table))
names(mean_std_table) <- gsub("([a-z])([A-Z])","\\1 \\2",names(mean_std_table))

#####################---Question_5---#####################
tidyData <- aggregate(x = mean_std_table[,3:81], by = list(activity = mean_std_table$activity, subject = mean_std_table$subject), FUN = mean)

