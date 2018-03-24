# Objective of the project is to work on creating a tidy data from the raw data files available.

1. The data files available for the analysis are in '.txt' format and are available as training dataset, test dataset and subject dataset.
2. Further the data is classifed into 'X data' and 'Y data'. Initial stage of the project is to read the files and store them in the object varaibles. As a part of the requirement, these data are merged using rbind function.
3. From the feature data, used grep function to perform the pattern matching of '\\'.
4. Mean and Standard Deviation is calculated and is stored in the xdata.
5. Added the descriptive variable names to the columns using the names() function.
6. Merged all datasets to combine all separate datasets together.
7. Extracted the tidy dataset using the write.table function as required and to prepare the data, used the aggregate function. 
