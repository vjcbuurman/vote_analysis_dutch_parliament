#Analysis 
rm(list=ls())

# TODO: indieners
# for example:
# J Houwers / used to be VVD, but from some point in 2015 on, not any more
# All his propositions, put up for vote, are 'in the name' of the VVD
# This means that on many occasions, VVD votes against 'its own' propositions
# This is weird of course.

# set user working directory!

load("~/Desktop/vote_analysis/read/analysis_data.Rdata")

# first analysis idea:
# a)
# simple dissimilarity matrix, MDS solution

# b)
# more complicated dissimilarity matrix
# e.g. weights if thing to vote on is 'important'
# take into account PvdA and VVD are governing parties?

# second: multidimensional unfolding?
# see items to vote on as things to rate
# see parties as raters

# third: take assymetric distances between voter, and party proposal to vote on

library(smacof)


###
# MDS
###
keep <- !indieners%in%c("NOT KNOWN", "NOT APPLICABLE", "")
results <- results[keep, ]
indieners <- indieners[keep]
vote.id <- vote.id[keep]

# column names: VVD, PvdA, PVV, SP, CDA, D66, CU, GL, SGP, PvdD, 50PLUS
dist.mat <- dist(t(results))

mds.sol <- mds(dist.mat, ndim=2, type="mspline"); mds.sol
plot(mds.sol, "Shepard")
summary(mds.sol)

party.points <- data.frame(party.name = colnames(results), mds.sol$conf)

library(ggplot2)
ggplot(data = party.points, aes(D1, D2, label=party.name)) + geom_label(aes(fill=party.name), colour="white", fontface="bold")
ggsave("political_spectrum.png", device="png")

# for example, sp en pvdd weird being together?
# however:
table(round(results[, 7]), round(results[, 10]))


