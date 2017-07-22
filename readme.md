## Introduction
This project started somewhere around the end of 2015 and I finally got around to (mostly) finishing it. Although the main purpose of the project was, as the description mentions, to reproduce many of the visualizations of the Dutch political parties in the political spectrum, much more could be done with the data. For example: a 2D representation of the dissimilarity matrix (based on euclidian distances) of the voting patterns might not be the right one!

## Warning
Note that the results of this analysis (especially before all todo's have been handled) have to be taken with a grain of salt.

This repository contains many todo's:
* a few pertaining to data cleaning itself
* a few pertaining of partitioning the data to coincide with shifts in government
* documentation needs to be improved, especially in regards to the use of all the scriptfiles
* taking time to perform a proper analysis

## Steps to reproduce the analysis performed
Note that you may have to check if all the specified paths in the `R` files and the `sh` files are correct for your machine (if you are not on mac, and do not store the repository on your desktop, it is likely to be incorrect).

1. download relevant pages via /download/read_html_files.sh
Note: curl may fail at times, so you will possibly need to rerun (parts) of the code, e.g. using read_html_single.sh
Note 2: for your convenience, any pages containing relevant info (instead of ALL read pages) have been zipped and included in the repository.

2. extract relevant info from the downloaded webpages via /read/read_html_files.R -> stored as R object(s) in results.RData

Note: mainly uses extract_info.R and some other scriptfiles for ad hoc fixes of pages deviating from the general structure

3. Transform the data extracted from the pages into R objects useful for analysis via /read/create_analysis_data.R -> stored as R object(s) in analysis_data.Rdata

4. Perform an analysis via analysis/analysis.R

Note: you'll note that in the .gitignore file that a folder called webpages is specified, this is where I (locally) save the 100K webpages downloaded (pages from 2013 through 2016). It also contains a file called read_html_files_tukey.sh, which is a local machine I used to run overnight to sequentially download all the webpages (which required different directory paths etc). This may be parallelized, but the last time I ran this on 40 threads at the same time, the site went down and downloading subsequently failed ;)


