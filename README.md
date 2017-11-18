# Getting and Cleaning Data Course Project

The project's purpose is to clean the data sets provided for this course in order to prepare the date for the further analisys.

The project contains the following files:
=========================================

 - 'README.md' - this file
 - 'run_analysis.R' - the script for data cleaning
 - 'CodeBook.md' - code book for the output data
 
Running the cleaning script
===========================
1. Make sure thay 'dplyr' package is installed. 
If it is not installed, than install it:
```
install.packages()
```
  
2. Set working directory to a folder containing data files from 'UCI HAR Dataset'.
Example:
```
setwd("/Users/user/code/course3/week4/UCI\ HAR\ Dataset")
```
3. Run the script:
```
run_analysis()
```

Output data
===========
The script creates 'output' folder into the workspace with files mentioned in the code book ('CodeBook.md')


