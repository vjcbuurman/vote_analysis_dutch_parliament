# sometimes 'besluit' has extra info, like the sum of the total votes etc
# we strip only to distinguish between major 5.

N <- length(vote.results)
for (i in 1:N){
 vote.results[[i]]$besluit <- paste(strsplit(vote.results[[i]]$besluit, split="")[[1]][1:7], collapse="", sep="")
}
