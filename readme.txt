Note that the results of this analysis (especially before all todo's have been handled) have to be taken with a grain of salt.

Warning:
This repository contains many todo's:
a few pertaining to data cleaning itself
a few pertaining of partitioning the data to coincide with shifts in government
documentation needs to be improved, especially in regards to the use of all the scriptfiles

Steps to reproduce:

1) download relevant pages via /download/read_html_files.sh
Note: curl may fail at times, so you will possibly need to rerun (parts) of the code, e.g. using read_html_single.sh
Note 2: for your convenience, any pages containing relevant info (instead of ALL read pages) have been zipped and included in the repository.

2) extract relevant info from the downloaded webpages via /read/read_html_files.R -> stored as R object(s) in results.RData

Note: mainly uses extract_info.R and some other scriptfiles for ad hoc fixes of pages deviating from the general structure

3) Transform the data extracted from the pages into R objects useful for analysis via /read/create_analysis_data.R -> stored as R object(s) in analysis_data.Rdata

4) Perform an analysis via analysis/analysis.R

Note: you'll note in the .gitignore file that a folder called webpages is ignored, this is where I (locally) save the 100K webpages downloaded (pages from 2013 through 2016). It also contains a file called read_html_files_tukey.sh, which is a local machine I used to run overnight to download all the webpages (which required different directory paths etc).



