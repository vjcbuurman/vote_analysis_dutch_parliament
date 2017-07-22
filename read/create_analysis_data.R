#Analysis 
#TODO
# check selection of votes from vote.results (remove not completely at random?)

rm(list=ls())

# set user working directory!
setwd("~/Desktop/vote_analysis/read/")

load("~/Desktop/vote_analysis/read/results.RData")

#TODO?
# change 'kabinet' people to party names?

vote.results <- final.result

# check for issues (i.e. unreadables)
issues <- numeric(length(vote.results))
for (i in 1:length(vote.results)){
  issues[i] <- vote.results[[i]]$unreadables>0
}
index <- which(issues==1)

# some add hoc cleaning:
# add party names to votes with names of people whos party was unreadable, usually because it was absent
source("manually_add_parties_to_names.R")
source("manually_add_besluit_to_vote.R")
source("fix_besluit.R")
# remove these votes as too little information about the votes is available through the government website.
vote.results <- vote.results[-c(11183, 11187, 11189, 11190, 11191, 11192)]

#check for issues after fixes
issues <- numeric(length(vote.results))
for (i in 1:length(vote.results)){
  issues[i] <- vote.results[[i]]$unreadables>0
}
index <- which(issues==1)

index

# should be run by hand:
# source("check_aggregates.R") 

dim(vote.results[[1]]$voting.results)
party.names <- sort(vote.results[[1]]$voting.results$party.names)

total.votes <- length(vote.results)
results <- matrix(0, nrow=total.votes, ncol=11)
colnames(results) <- party.names
indieners <- character(total.votes)
vote.id <- character(total.votes)
for (i in 1:total.votes){
  #use index to take only interesting parties
  index <- which(vote.results[[i]]$voting.results$party.names%in%party.names)
  if (length(index)==11){
    indieners[i] <- vote.results[[i]]$indiener.partij
    
    votes <- vote.results[[i]]$voting.results[index, ]
    ordering <- order(votes$party.names)
    votes <- votes[ordering, ]
    
    results[i, ] <- as.numeric(as.character(votes[, 3]))/as.numeric(as.character(votes[, 2]))
    
    #temp <- as.numeric(as.character(vote.results[[i]]$voting.results[index, 4]))/as.numeric(as.character(vote.results[[i]]$voting.results[index, 2]))
    #results[i, ] <- temp[order(vote.results[[i]]$voting.results$party.names[index])]  
    vote.id[i] <- vote.results[[i]]$vote.id
  }
}
#results do not include the not partaken and mistake votes (e.g. unreadable or empty vote).

rownames(results) <- vote.id

ls()

save(list=c("vote.results", "indieners", "results", "vote.id"), file="analysis_data.Rdata")
