rm(list=ls())
load("~/Desktop/vote_analysis/read/analysis_data.Rdata")

N <- length(vote.results)
filename <- character(N)

for (i in 1:N){
  filename[i] <- vote.results[[i]]$filename
}

text.to.write <- paste("zip informative_webpages.zip", paste(unique(filename),collapse=" "))

writeLines(text.to.write, "zip_instruction.sh")


