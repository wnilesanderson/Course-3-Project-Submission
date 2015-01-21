---
title: "Explanation of the script"
author: "William N. Anderson"
date: "Wednesday, January 21, 2015"
output: html_document
---


The R script for this project is contained in the single file run_analysis.R. No other script files are used.

In order to run the code the packages stringr and reshape2 must be installed and loaded. 

It is assumed that the working directory is the directory UCI HAR Dataset, which was created when the downloaded data were unzipped. If the working directory is any other directory, the assignment of datadir in line 11 of the script must be changed appropriately to point to the directory UCI HAR Dataset. No other changes to the code would be needed.

The basic steps in the script are as follows; the code itself is heavily commented, and the details are not repeated here.

* The input data files, as described in the code book, were read using the read.table function. 
* Meaningful activity names were created. The new labels were input by hand; the input file activity_labels.txt was used purely as a reference for the coding levels.
* Meaningful result variable names were created using R statements, without typing the new names. There were two reasons for this approach.
    + A reader can compare the resulting names directly to the orginal names, because the alphabetic characters are the same. (Except for removing duplicate instances of the word Body in some names.)
    + The automatic generation makes it much less likely that typing mistakes will cause incorrect results.
* Subject and activity values were combined with the results. Because there were no suitable link fields the combination was based purely on the order of observations in the various sets.
* The result set was reduced to contain only the results that were needed for analysis.

* The result set was transfomed to a long form, and then the various means were computed using the reshape2 package.

* The output was written to a flat comma-delimited file. The Activity names are quoted in the output file. The comma delimited format was chosen in preference to the default space delimiter because the presence of blanks in Activity names has the potential to cause issues when reading back the table. If commas had been present in the Activity names some other format would have been chosen.

* The script itself has code to read back the output file. This code is commented out, but is available for any user to run. This reading code was tested. The file was also opened in Excel and read in SAS as additional tests. 
    
    
