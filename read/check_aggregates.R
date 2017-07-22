# this is a dump file I used to perform some on the fly aggregate checks of the data.
# can be used e.g. to check how many parties have put up something for a vote)
# or check that there as many unique vote-id's as there are vote results in vote.results
N <- length(vote.results)

names(vote.results[[1]])
sapply(names(vote.results[[1]]), function(i) assign(i, character(), envir=.GlobalEnv))

for (i in 1:N){
  filename[i] <- vote.results[[i]]$filename
  page.number[i] <- vote.results[[i]]$page.number
  vote.number[i] <- vote.results[[i]]$vote.number
  vote.id[i] <- vote.results[[i]]$vote.id
  unreadables[i] <- vote.results[[i]]$unreadables
  date[i] <- vote.results[[i]]$description
  date[i] <- vote.results[[i]]$date
  indiener.partij[i] <- vote.results[[i]]$indiener.partij
  indiener.fractielid[i] <- vote.results[[i]]$indiener.fractielid
  besluit[i] <- vote.results[[i]]$besluit
  vote.type[i] <- vote.results[[i]]$vote.type
}

length(unique(filename))
length(unique(page.number))
length(unique(vote.number))
length(unique(vote.id))
length(unique(unreadables))
length(unique(description))
length(unique(date))
length(unique(indiener.partij))
length(unique(indiener.fractielid))
length(unique(besluit))
length(unique(vote.type))

