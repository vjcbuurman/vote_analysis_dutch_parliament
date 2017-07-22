# sometimes, extra html tags are not given, such as <p> that mess up reading the info for that given line.
# here we manually add these info: we go to the page, check what 'besluit' has been taken, and add it to the data.

for (i in index){
  if (vote.results[[i]]$vote.id == "31389-98"){
    vote.results[[i]]$besluit <- "Verworpen."
    vote.results[[i]]$unreadables <- vote.results[[i]]$unreadables - 1
  } else if (vote.results[[i]]$vote.id == "31389-112"){
    vote.results[[i]]$besluit <- "Aangenomen."
    vote.results[[i]]$unreadables <- vote.results[[i]]$unreadables - 1
  } else if (vote.results[[i]]$vote.id == "29689-572"){
    vote.results[[i]]$besluit <- "Verworpen."
    vote.results[[i]]$unreadables <- vote.results[[i]]$unreadables - 1
  } else if (vote.results[[i]]$vote.id == "34023"){
    vote.results[[i]]$besluit <- "Aangenomen."
    vote.results[[i]]$unreadables <- vote.results[[i]]$unreadables - 1
  } else if (vote.results[[i]]$vote.id == "33962-117"){
    vote.results[[i]]$besluit <- "Aangenomen."
    vote.results[[i]]$unreadables <- vote.results[[i]]$unreadables - 1
  } else if (vote.results[[i]]$vote.id == "33962-142"){
    vote.results[[i]]$besluit <- "Aangenomen"
    vote.results[[i]]$unreadables <- vote.results[[i]]$unreadables - 1
  } else if (vote.results[[i]]$vote.id == "33675"){
    vote.results[[i]]$besluit <- "Aangenomen."
    #contains the following note:
    # (Noot: De voorzitter:
    #     De aanwezige leden van de VVD wordt aantekening verleend dat zij geacht wensen te
    #   worden tegen artikel I te hebben gestemd.)
    vote.results[[i]]$unreadables <- vote.results[[i]]$unreadables - 1
  } else if (vote.results[[i]]$vote.id == "33118-23"){
    vote.results[[i]]$besluit <- "Verworpen."
    vote.results[[i]]$unreadables <- vote.results[[i]]$unreadables - 1
  } else if (vote.results[[i]]$vote.id == "34191"){
    vote.results[[i]]$besluit <- "Aangenomen."
    # contains the following note:
    # (De Voorzitter: de aanwezige leden van de fractie van de SP wordt aantekening
    #   verleend dat zij geacht wensen te worden tegen de onderdelen van de wet te hebben
    #   gestemd die betrekking hebben op het opheffen van het College bouw zorginstellingen.)
    vote.results[[i]]$unreadables <- vote.results[[i]]$unreadables - 1
  } else if (vote.results[[i]]$vote.id == "32847-252"){
    vote.results[[i]]$besluit <- "Aangenomen."
    vote.results[[i]]$unreadables <- vote.results[[i]]$unreadables - 1
  } else if (vote.results[[i]]$vote.id == "34550-XVI-59"){
    vote.results[[i]]$besluit <- "Verworpen."
    vote.results[[i]]$unreadables <- vote.results[[i]]$unreadables - 1
  } else if (vote.results[[i]]$vote.id == "33118-57"){
    vote.results[[i]]$besluit <- "Aangenomen."
    vote.results[[i]]$unreadables <- vote.results[[i]]$unreadables - 1
  }
}