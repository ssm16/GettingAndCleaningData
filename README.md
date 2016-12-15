### Content of repo

This repo contains four files:
* run_analysis.R: this file contains my code to fulfill the assignment for "Getting and Cleaning Data"
* CodeBook.md: within this file the variables in "data_set_means.txt" (coursera assigment page) are explained
* data_set_means.txt: resulting data set that was also copied to coursera assignment page
* README.md: this file gives more information on the assignment and the working of run_analysis.R

### Information on run_analysis.R and the resulting table

run_analysis.R starts with some information on the assignment and where I got information on how to
approach the tasks (in addition to the course, R help,...). 

The file contains a listing of the 5 steps of the assignment as given on the coursera page at the top
and you will again find these steps with comments and further information as you follow the flow of 
the file. The steps were done in order except for step 4 which was already included in step 1.

In addition to the 5 steps asked for I also included the loading of dplyr, getting of the data as
well as writing out the table.

The table can be read into R again with read.table("data_set_means.txt", header=TRUE)

The created table is in narrow form which means that there is a column "activity" in which all
activities are listed. This way there are 6 entries for each subject. According to 
https://thoughtfulbloke.wordpress.com/2015/09/09/getting-and-cleaning-the-assignment/
this is explicitly allowed and also an option to create a tidy data set. On the same page it
is mentioned that the resulting table can have different numbers of rows and columns depending
on how step 2 was interpreted (which variables should be chosen? Only those with "mean()" and "std"
at the end or others to?) Since it is not closer specified in the assignment we have the possibility
to decide by ourselves.
