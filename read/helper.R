# this is a file I used to store some code to automate some of the ad hoc fixing I needed to perform

# automate the if else statements
# alternatively could have been solved using a for loop and two equivalently sorted arrays of information
# the danger of the latter is that future refreshments of downloads of the pages might mess up the ordering...
# ... of the initial array and thus invalidate the ordering of the array with the manually added party names.
temp <- paste(' else if ( vote.results[[i]]$indiener.fractielid == "', unique(probleem.indiener.fractielid), '") {
  vote.results[[i]]$indiener.partij <- ""
  vote.results[[i]]$unreadables <- vote.results[[i]]$unreadables - 1
}', collapse="", sep="")

writeLines(temp, "temp.txt")
