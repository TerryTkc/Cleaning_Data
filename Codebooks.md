Codebooks

features: -Import the feature textfile (features.txt), and then store only feature labels from the text file.
          -Convert into character type.
          
activity_label: -Import the activity_labels textfile (activity_labels.txt), and then store only activity_labels from the text file.
                -Convert into character type.

xTrainData: Read the x_train textfile. (x_train.txt)

yTrainData: Read the y_train textfile. (y_train.txt)

subjectData: Read the subject train data textfile. (subject_train.txt)

trainData: -Table that includes all the training data variable.
            -Change the column name into "Subject", "Activity", "Features..."

xTestData: Read the x_test textfile. (x_test.txt)

yTestData: Read the y_test textfile. (y_test.txt)

subjectTestData: Read the subject test data textfile. (subject_test.txt)

testData: -Table that includes all the testing data variable.
          -Change the column name into "Subject", "Activity", "Features..."

completeData: Table that includes both training and testing data.

mean_std_table: -Table that only have mean and std variables.
                -Simplify the column's names:
                  *Exclude parathesis
                  *"Acc" into "Accelerator"
                  *"Gyro" into "Gyroscope"
                  *"Mag" into "Magnitude"
                  *"std" into "standard_deviation"
                  *"t" into "Time"
                  *"f" into "Frequency"
      

tidyData: Table that contains tidy data according to question 5.
