# can be used to perform some sanity checks to see if all the processing has been done (at least approximately) correctly.

head(which(((indieners=="VVD") & (results[, 11]==0))))
for (i in 1:length(vote.results)){
  if (vote.results[[i]]$vote.id == "31757-71"){
    break
  }
}
i

vote.results[[6699]]
results["32839-11", ]

