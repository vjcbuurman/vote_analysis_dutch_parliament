# method:
# put names in search engine (e.g. duckduckgo), and see which party they have been affiliated with (preferebly during the time of the voting)
# method is not perfect because it not not necessarily correct, but probably correct for most names.
# e.g. they may have operated seperately from the named parties at the time of the vote
# or: they may have switched parties
# or any of the above may have happened in the timespan of 2013 - 2016, but we do 1 check for all years.

# the reason for the weird ordering is because I added names in 2 batches. One based on webpages pulled March 25th, 2016. The other July 20th 2017.
# (in the mean time many more partymembers had left and the website no longer shows their name including the party under which they, at that time, put up the piece for vote)

# PVV, GL, SP, GrkO??, CDA, PvdA, D66, CU, Klein, kabinet, SGP, 
# PvdD, Van Vliet, GrBvK, VVD, 50PLUS, Houwers

for (i in index){
  if (vote.results[[i]]$indiener.partij == "NOT READABLE"){
    if (vote.results[[i]]$indiener.fractielid == "Indiener: E. Ouwehand, Tweede Kamerlid") {
      vote.results[[i]]$indiener.partij <- "PvdD"
      vote.results[[i]]$unreadables <- vote.results[[i]]$unreadables - 1
    } else if (vote.results[[i]]$indiener.fractielid == "Indiener: M.A. Berndsen-Jansen, Tweede Kamerlid") {
      vote.results[[i]]$indiener.partij <- "D66"
      vote.results[[i]]$unreadables <- vote.results[[i]]$unreadables - 1
    } else if (vote.results[[i]]$indiener.fractielid == "Indiener: Y.J. van Hijum, Tweede Kamerlid") {
      vote.results[[i]]$indiener.partij <- "CDA"
      vote.results[[i]]$unreadables <- vote.results[[i]]$unreadables - 1
    } else if (vote.results[[i]]$indiener.fractielid == "Indiener: W. Hachchi, Tweede Kamerlid") {
      vote.results[[i]]$indiener.partij <- "D66"
      vote.results[[i]]$unreadables <- vote.results[[i]]$unreadables - 1
    } else if (vote.results[[i]]$indiener.fractielid == "Indiener: P.F.C. (Paulus) Jansen, Tweede Kamerlid") {
      vote.results[[i]]$indiener.partij <- "SP"
      vote.results[[i]]$unreadables <- vote.results[[i]]$unreadables - 1
    } else if (vote.results[[i]]$indiener.fractielid == "Indiener: R.W. Leegte, Tweede Kamerlid") {
      vote.results[[i]]$indiener.partij <- "VVD"
      vote.results[[i]]$unreadables <- vote.results[[i]]$unreadables - 1
    } else if (vote.results[[i]]$indiener.fractielid == "Indiener: G.A. van der Steur, Tweede Kamerlid") {
      vote.results[[i]]$indiener.partij <- "VVD"
      vote.results[[i]]$unreadables <- vote.results[[i]]$unreadables - 1
    } else if (vote.results[[i]]$indiener.fractielid == "Indiener: K.H.D.M. Dijkhoff, Tweede Kamerlid") {
      vote.results[[i]]$indiener.partij <- "VVD"
      vote.results[[i]]$unreadables <- vote.results[[i]]$unreadables - 1
    } else if (vote.results[[i]]$indiener.fractielid == "Indiener: M. Hilkens, Tweede Kamerlid") {
      vote.results[[i]]$indiener.partij <- "PvdA"
      vote.results[[i]]$unreadables <- vote.results[[i]]$unreadables - 1
    } else if (vote.results[[i]]$indiener.fractielid == "Indiener: G.M. Segers, Tweede Kamerlid") {
      vote.results[[i]]$indiener.partij <- "CU"
      vote.results[[i]]$unreadables <- vote.results[[i]]$unreadables - 1
    } else if (vote.results[[i]]$indiener.fractielid == "Indiener: M.L. Verheijen, Tweede Kamerlid") {
      vote.results[[i]]$indiener.partij <- "VVD"
      vote.results[[i]]$unreadables <- vote.results[[i]]$unreadables - 1
    } else if (vote.results[[i]]$indiener.fractielid == "Indiener: A. Slob, Tweede Kamerlid") {
      vote.results[[i]]$indiener.partij <- "CU"
      vote.results[[i]]$unreadables <- vote.results[[i]]$unreadables - 1
    } else if (vote.results[[i]]$indiener.fractielid == "Indiener: Staaij van der C.G., Tweede Kamerlid") {
      vote.results[[i]]$indiener.partij <- "SGP"
      vote.results[[i]]$unreadables <- vote.results[[i]]$unreadables - 1
    } else if (vote.results[[i]]$indiener.fractielid == "Indiener: Schinkelshoek J., Tweede Kamerlid") {
      vote.results[[i]]$indiener.partij <- "CDA"
      vote.results[[i]]$unreadables <- vote.results[[i]]$unreadables - 1
    } else if (vote.results[[i]]$indiener.fractielid == "Indiener: Griffith L.J., Tweede Kamerlid") {
      vote.results[[i]]$indiener.partij <- "VVD"
      vote.results[[i]]$unreadables <- vote.results[[i]]$unreadables - 1
    } else if (vote.results[[i]]$indiener.fractielid == "Indiener: Raak van A.A.G.M., Tweede Kamerlid") {
      vote.results[[i]]$indiener.partij <- "SP"
      vote.results[[i]]$unreadables <- vote.results[[i]]$unreadables - 1
    } else if (vote.results[[i]]$indiener.fractielid == "Indiener: P.M.M. Heijnen, Tweede Kamerlid") {
      vote.results[[i]]$indiener.partij <- "PvdA"
      vote.results[[i]]$unreadables <- vote.results[[i]]$unreadables - 1
    } else if (vote.results[[i]]$indiener.fractielid == "Indiener: M. Smits, Tweede Kamerlid") {
      vote.results[[i]]$indiener.partij <- "SP"
      vote.results[[i]]$unreadables <- vote.results[[i]]$unreadables - 1
    } else if (vote.results[[i]]$indiener.fractielid == "Indiener: A. van Ojik, Tweede Kamerlid") {
      vote.results[[i]]$indiener.partij <- "GL"
      vote.results[[i]]$unreadables <- vote.results[[i]]$unreadables - 1
    } else if (vote.results[[i]]$indiener.fractielid == "Indiener: A.G. Schouw, Tweede Kamerlid") {
      vote.results[[i]]$indiener.partij <- "D66"
      vote.results[[i]]$unreadables <- vote.results[[i]]$unreadables - 1
    } else if (vote.results[[i]]$indiener.fractielid == "Indiener: S. de Rouwe, Tweede Kamerlid") {
      vote.results[[i]]$indiener.partij <- "CDA"
      vote.results[[i]]$unreadables <- vote.results[[i]]$unreadables - 1
    } else if (vote.results[[i]]$indiener.fractielid == "Indiener: D.E. Bonis, Tweede Kamerlid") {
      vote.results[[i]]$indiener.partij <- "PvdA"
      vote.results[[i]]$unreadables <- vote.results[[i]]$unreadables - 1
    } else if (vote.results[[i]]$indiener.fractielid == "Indiener: L.T. Bouwmeester, Tweede Kamerlid") {
      vote.results[[i]]$indiener.partij <- "PvdA"
      vote.results[[i]]$unreadables <- vote.results[[i]]$unreadables - 1
    } else if (vote.results[[i]]$indiener.fractielid == "Indiener: J.M.A.M. de Wit, Tweede Kamerlid") {
      vote.results[[i]]$indiener.partij <- "SP"
      vote.results[[i]]$unreadables <- vote.results[[i]]$unreadables - 1
    } else if (vote.results[[i]]$indiener.fractielid == "Indiener: P. Oskam, Tweede Kamerlid") {
      vote.results[[i]]$indiener.partij <- "CDA"
      vote.results[[i]]$unreadables <- vote.results[[i]]$unreadables - 1
    } else if (vote.results[[i]]$indiener.fractielid == "Indiener: A. Elissen, Tweede Kamerlid") {
      vote.results[[i]]$indiener.partij <- "PVV"
      vote.results[[i]]$unreadables <- vote.results[[i]]$unreadables - 1
    } else if (vote.results[[i]]$indiener.fractielid == "Indiener: Anker E.W., Tweede Kamerlid") {
      vote.results[[i]]$indiener.partij <- "PvdA"
      vote.results[[i]]$unreadables <- vote.results[[i]]$unreadables - 1
    } else if (vote.results[[i]]$indiener.fractielid == "Indiener: P.J.M. Litjens, Tweede Kamerlid") {
      vote.results[[i]]$indiener.partij <- "VVD"
      vote.results[[i]]$unreadables <- vote.results[[i]]$unreadables - 1
    } else if (vote.results[[i]]$indiener.fractielid == "Indiener: G.P.J. Koopmans, Tweede Kamerlid") {
      vote.results[[i]]$indiener.partij <- "CDA"
      vote.results[[i]]$unreadables <- vote.results[[i]]$unreadables - 1
    } else if (vote.results[[i]]$indiener.fractielid == "Indiener: M.I. Hamer, Tweede Kamerlid") {
      vote.results[[i]]$indiener.partij <- "PvdA"
      vote.results[[i]]$unreadables <- vote.results[[i]]$unreadables - 1
    } else if (vote.results[[i]]$indiener.fractielid == "Indiener: T. Venrooy-van Ark, Tweede Kamerlid") {
      vote.results[[i]]$indiener.partij <- "VVD"
      vote.results[[i]]$unreadables <- vote.results[[i]]$unreadables - 1
    } else if (vote.results[[i]]$indiener.fractielid == "Indiener: M.H.P. van Dam, Tweede Kamerlid") {
      vote.results[[i]]$indiener.partij <- "PvdA"
      vote.results[[i]]$unreadables <- vote.results[[i]]$unreadables - 1
    } else if (vote.results[[i]]$indiener.fractielid == "Indiener: M.E. Huizing, Tweede Kamerlid") {
      vote.results[[i]]$indiener.partij <- "VVD"
      vote.results[[i]]$unreadables <- vote.results[[i]]$unreadables - 1
    } else if (vote.results[[i]]$indiener.fractielid == "Indiener: B.C. de Liefde, Tweede Kamerlid") {
      vote.results[[i]]$indiener.partij <- "VVD"
      vote.results[[i]]$unreadables <- vote.results[[i]]$unreadables - 1
    } else if (vote.results[[i]]$indiener.fractielid == "Indiener: C. van Nieuwenhuizen-Wijbenga, Tweede Kamerlid") {
      vote.results[[i]]$indiener.partij <- "VVD"
      vote.results[[i]]$unreadables <- vote.results[[i]]$unreadables - 1
    } else if (vote.results[[i]]$indiener.fractielid == "Indiener: C.A. Ortega-Martijn, Tweede Kamerlid") {
      vote.results[[i]]$indiener.partij <- "CU"
      vote.results[[i]]$unreadables <- vote.results[[i]]$unreadables - 1
    } else if (vote.results[[i]]$indiener.fractielid == "Indiener: F. Koser Kaya, Tweede Kamerlid") {
      vote.results[[i]]$indiener.partij <- "D66"
      vote.results[[i]]$unreadables <- vote.results[[i]]$unreadables - 1
    } else if (vote.results[[i]]$indiener.fractielid == "Indiener: M.H.H. Baay-Timmerman, Tweede Kamerlid") {
      vote.results[[i]]$indiener.partij <- "50PLUS"
      vote.results[[i]]$unreadables <- vote.results[[i]]$unreadables - 1
    } else if (vote.results[[i]]$indiener.fractielid == "Indiener: C.E. Ellemeet, Tweede Kamerlid") {
      vote.results[[i]]$indiener.partij <- "GL"
      vote.results[[i]]$unreadables <- vote.results[[i]]$unreadables - 1
    } else if (vote.results[[i]]$indiener.fractielid == "Indiener: M.J.J. Rebel, Tweede Kamerlid") {
      vote.results[[i]]$indiener.partij <- "PvdA"
      vote.results[[i]]$unreadables <- vote.results[[i]]$unreadables - 1
    } else if (vote.results[[i]]$indiener.fractielid == "Indiener: K. Gerbrands, Tweede Kamerlid") {
      vote.results[[i]]$indiener.partij <- "PVV"
      vote.results[[i]]$unreadables <- vote.results[[i]]$unreadables - 1
    } else if (vote.results[[i]]$indiener.fractielid == "Indiener: J.E. Thijsen, bijzondere gedelegeerde") {
      vote.results[[i]]$indiener.partij <- "NOT KNOWN"
      vote.results[[i]]$unreadables <- vote.results[[i]]$unreadables - 1
    } else if (vote.results[[i]]$indiener.fractielid == "Indiener: A.M. Sneek , bijzondere gedelegeerde") {
      vote.results[[i]]$indiener.partij <- "NOT KNOWN"
      vote.results[[i]]$unreadables <- vote.results[[i]]$unreadables - 1
    } else if (vote.results[[i]]$indiener.fractielid == "Indiener: A.C.G. Bikker, bijzondere gedelegeerde") {
      vote.results[[i]]$indiener.partij <- "NOT KNOWN"
      vote.results[[i]]$unreadables <- vote.results[[i]]$unreadables - 1
    } else if (vote.results[[i]]$indiener.fractielid == "Indiener: A. van Miltenburg, voorzitter van de commissie voor de Werkwijze") {
      vote.results[[i]]$indiener.partij <- "NOT KNOWN"
      vote.results[[i]]$unreadables <- vote.results[[i]]$unreadables - 1
    } else if (vote.results[[i]]$indiener.fractielid == "Indiener: Pechtold, Tweede Kamerlid") {
      vote.results[[i]]$indiener.partij <- "D66"
      vote.results[[i]]$unreadables <- vote.results[[i]]$unreadables - 1
    } else if (vote.results[[i]]$indiener.fractielid == "Indiener: Staaij, van der, Tweede Kamerlid") {
      vote.results[[i]]$indiener.partij <- "SGP"
      vote.results[[i]]$unreadables <- vote.results[[i]]$unreadables - 1
    } else if ( vote.results[[i]]$indiener.fractielid == "Indiener: A.Z. Merkies, Tweede Kamerlid") {
      vote.results[[i]]$indiener.partij <- "SP"
      vote.results[[i]]$unreadables <- vote.results[[i]]$unreadables - 1
    } else if ( vote.results[[i]]$indiener.fractielid == "Indiener: R.J. Klever, Tweede Kamerlid") {
      vote.results[[i]]$indiener.partij <- "PVV"
      vote.results[[i]]$unreadables <- vote.results[[i]]$unreadables - 1
    } else if ( vote.results[[i]]$indiener.fractielid == "Indiener: M.L. (Mei Li) Vos, Tweede Kamerlid") {
      vote.results[[i]]$indiener.partij <- "PvdA"
      vote.results[[i]]$unreadables <- vote.results[[i]]$unreadables - 1
    } else if ( vote.results[[i]]$indiener.fractielid == "Indiener: N.P.M. Klein, Tweede Kamerlid") {
      vote.results[[i]]$indiener.partij <- "50PLUS"
      # note, this parliament member operated on his own, after ~2014
      vote.results[[i]]$unreadables <- vote.results[[i]]$unreadables - 1
    } else if ( vote.results[[i]]$indiener.fractielid == "Indiener: M. Mohandis, Tweede Kamerlid") {
      vote.results[[i]]$indiener.partij <- "PvdA"
      vote.results[[i]]$unreadables <- vote.results[[i]]$unreadables - 1
    } else if ( vote.results[[i]]$indiener.fractielid == "Indiener: H.P.J. van Gerven, Tweede Kamerlid") {
      vote.results[[i]]$indiener.partij <- "SP"
      vote.results[[i]]$unreadables <- vote.results[[i]]$unreadables - 1
    } else if ( vote.results[[i]]$indiener.fractielid == "Indiener: J.C. (Jan) Vos, Tweede Kamerlid") {
      vote.results[[i]]$indiener.partij <- "PvdA"
      vote.results[[i]]$unreadables <- vote.results[[i]]$unreadables - 1
    } else if ( vote.results[[i]]$indiener.fractielid == "Indiener: P. Ulenbelt, Tweede Kamerlid") {
      vote.results[[i]]$indiener.partij <- "SP"
      vote.results[[i]]$unreadables <- vote.results[[i]]$unreadables - 1
    } else if ( vote.results[[i]]$indiener.fractielid == "Indiener: R.A. van Vliet, Tweede Kamerlid") {
      vote.results[[i]]$indiener.partij <- "PVV"
      vote.results[[i]]$unreadables <- vote.results[[i]]$unreadables - 1
    } else if ( vote.results[[i]]$indiener.fractielid == "Indiener: S.M.J.G. Gesthuizen, Tweede Kamerlid") {
      vote.results[[i]]$indiener.partij <- "SP"
      vote.results[[i]]$unreadables <- vote.results[[i]]$unreadables - 1
    } else if ( vote.results[[i]]$indiener.fractielid == "Indiener: J.J. van Klaveren, Tweede Kamerlid") {
      vote.results[[i]]$indiener.partij <- "PVV"
      #note this one also operated individually at some point
      vote.results[[i]]$unreadables <- vote.results[[i]]$unreadables - 1
    } else if ( vote.results[[i]]$indiener.fractielid == "Indiener: L. Jacobi, Tweede Kamerlid") {
      vote.results[[i]]$indiener.partij <- "PvdA"
      vote.results[[i]]$unreadables <- vote.results[[i]]$unreadables - 1
    } else if ( vote.results[[i]]$indiener.fractielid == "Indiener: A.M.C. Eijsink, Tweede Kamerlid") {
      vote.results[[i]]$indiener.partij <- "PvdA"
      vote.results[[i]]$unreadables <- vote.results[[i]]$unreadables - 1
    } else if ( vote.results[[i]]$indiener.fractielid == "Indiener: H. van Bommel, Tweede Kamerlid") {
      vote.results[[i]]$indiener.partij <- "SP"
      vote.results[[i]]$unreadables <- vote.results[[i]]$unreadables - 1
    } else if ( vote.results[[i]]$indiener.fractielid == "Indiener: L. Bontes, Tweede Kamerlid") {
      vote.results[[i]]$indiener.partij <- "PVV"
      # deze is ook dubieus
      vote.results[[i]]$unreadables <- vote.results[[i]]$unreadables - 1
    } else if ( vote.results[[i]]$indiener.fractielid == "Indiener: A. Marcouch, Tweede Kamerlid") {
      vote.results[[i]]$indiener.partij <- "PvdA"
      vote.results[[i]]$unreadables <- vote.results[[i]]$unreadables - 1
    } else if ( vote.results[[i]]$indiener.fractielid == "Indiener: B.I. van der Burg, Tweede Kamerlid") {
      vote.results[[i]]$indiener.partij <- "VVD"
      vote.results[[i]]$unreadables <- vote.results[[i]]$unreadables - 1
    } else if ( vote.results[[i]]$indiener.fractielid == "Indiener: J.W.M. Kerstens, Tweede Kamerlid") {
      vote.results[[i]]$indiener.partij <- "PvdA"
      vote.results[[i]]$unreadables <- vote.results[[i]]$unreadables - 1
    } else if ( vote.results[[i]]$indiener.fractielid == "Indiener: K.C.J. Straus, Tweede Kamerlid") {
      vote.results[[i]]$indiener.partij <- "VVD"
      vote.results[[i]]$unreadables <- vote.results[[i]]$unreadables - 1
    } else if ( vote.results[[i]]$indiener.fractielid == "Indiener: A.A. (Albert) de Vries, Tweede Kamerlid") {
      vote.results[[i]]$indiener.partij <- "PvdA"
      vote.results[[i]]$unreadables <- vote.results[[i]]$unreadables - 1
    } else if ( vote.results[[i]]$indiener.fractielid == "Indiener: R.F.A. Oosenbrug, Tweede Kamerlid") {
      vote.results[[i]]$indiener.partij <- "PvdA"
      vote.results[[i]]$unreadables <- vote.results[[i]]$unreadables - 1
    } else if ( vote.results[[i]]$indiener.fractielid == "Indiener: F. Bashir, Tweede Kamerlid") {
      vote.results[[i]]$indiener.partij <- "D66"
      vote.results[[i]]$unreadables <- vote.results[[i]]$unreadables - 1
    } else if ( vote.results[[i]]$indiener.fractielid == "Indiener: B.G. de Boer, Tweede Kamerlid") {
      vote.results[[i]]$indiener.partij <- "VVD"
      vote.results[[i]]$unreadables <- vote.results[[i]]$unreadables - 1
    } else if ( vote.results[[i]]$indiener.fractielid == "Indiener: R.A. Vermeij, Tweede Kamerlid") {
      vote.results[[i]]$indiener.partij <- "PvdA"
      vote.results[[i]]$unreadables <- vote.results[[i]]$unreadables - 1
    } else if ( vote.results[[i]]$indiener.fractielid == "Indiener: K. Yücel, Tweede Kamerlid") {
      vote.results[[i]]$indiener.partij <- "PvdA"
      vote.results[[i]]$unreadables <- vote.results[[i]]$unreadables - 1
    } else if ( vote.results[[i]]$indiener.fractielid == "Indiener: J. Taverne, Tweede Kamerlid") {
      vote.results[[i]]$indiener.partij <- "VVD"
      vote.results[[i]]$unreadables <- vote.results[[i]]$unreadables - 1
    } else if ( vote.results[[i]]$indiener.fractielid == "Indiener: M. Servaes, Tweede Kamerlid") {
      vote.results[[i]]$indiener.partij <- "PvdA"
      vote.results[[i]]$unreadables <- vote.results[[i]]$unreadables - 1
    } else if ( vote.results[[i]]$indiener.fractielid == "Indiener: J. Recourt, Tweede Kamerlid") {
      vote.results[[i]]$indiener.partij <- "PvdA"
      vote.results[[i]]$unreadables <- vote.results[[i]]$unreadables - 1
    } else if ( vote.results[[i]]$indiener.fractielid == "Indiener: J.S. Monasch, Tweede Kamerlid") {
      vote.results[[i]]$indiener.partij <- "PvdA"
      vote.results[[i]]$unreadables <- vote.results[[i]]$unreadables - 1
    } else if ( vote.results[[i]]$indiener.fractielid == "Indiener: D. Hoogland, Tweede Kamerlid") {
      vote.results[[i]]$indiener.partij <- "PvdA"
      vote.results[[i]]$unreadables <- vote.results[[i]]$unreadables - 1
    } else if ( vote.results[[i]]$indiener.fractielid == "Indiener: L. Ypma, Tweede Kamerlid") {
      vote.results[[i]]$indiener.partij <- "PvdA"
      vote.results[[i]]$unreadables <- vote.results[[i]]$unreadables - 1
    } else if ( vote.results[[i]]$indiener.fractielid == "Indiener: O.E.T. (Otwin) van Dijk, Tweede Kamerlid") {
      vote.results[[i]]$indiener.partij <- "PvdA"
      vote.results[[i]]$unreadables <- vote.results[[i]]$unreadables - 1
    } else if ( vote.results[[i]]$indiener.fractielid == "Indiener: M.E. Maij, Tweede Kamerlid") {
      vote.results[[i]]$indiener.partij <- "PvdA"
      vote.results[[i]]$unreadables <- vote.results[[i]]$unreadables - 1
    } else if ( vote.results[[i]]$indiener.fractielid == "Indiener: T.M.Ch. Elias, Tweede Kamerlid") {
      vote.results[[i]]$indiener.partij <- "VVD"
      vote.results[[i]]$unreadables <- vote.results[[i]]$unreadables - 1
    } else if ( vote.results[[i]]$indiener.fractielid == "Indiener: T.M. Jadnanansing, Tweede Kamerlid") {
      vote.results[[i]]$indiener.partij <- "PvdA"
      vote.results[[i]]$unreadables <- vote.results[[i]]$unreadables - 1
    } else if ( vote.results[[i]]$indiener.fractielid == "Indiener: E.M.A. Smaling, Tweede Kamerlid") {
      vote.results[[i]]$indiener.partij <- "SP"
      vote.results[[i]]$unreadables <- vote.results[[i]]$unreadables - 1
    } else if ( vote.results[[i]]$indiener.fractielid == "Indiener: A.G. Wolbert, Tweede Kamerlid") {
      vote.results[[i]]$indiener.partij <- "PvdA"
      vote.results[[i]]$unreadables <- vote.results[[i]]$unreadables - 1
    } else if ( vote.results[[i]]$indiener.fractielid == "Indiener: H. Fokke, Tweede Kamerlid") {
      vote.results[[i]]$indiener.partij <- "PvdA"
      vote.results[[i]]$unreadables <- vote.results[[i]]$unreadables - 1
    } else if ( vote.results[[i]]$indiener.fractielid == "Indiener: J. Houwers, Tweede Kamerlid") {
      vote.results[[i]]$indiener.partij <- "VVD"
      vote.results[[i]]$unreadables <- vote.results[[i]]$unreadables - 1
    } else if ( vote.results[[i]]$indiener.fractielid == "Indiener: A.W. Lucas, Tweede Kamerlid") {
      vote.results[[i]]$indiener.partij <- "VVD"
      vote.results[[i]]$unreadables <- vote.results[[i]]$unreadables - 1
    } else if ( vote.results[[i]]$indiener.fractielid == "Indiener: M.S. van Veen, Tweede Kamerlid") {
      vote.results[[i]]$indiener.partij <- "VVD"
      vote.results[[i]]$unreadables <- vote.results[[i]]$unreadables - 1
    } else if ( vote.results[[i]]$indiener.fractielid == "Indiener: S.C.C.M. Potters, Tweede Kamerlid") {
      vote.results[[i]]$indiener.partij <- "VVD"
      vote.results[[i]]$unreadables <- vote.results[[i]]$unreadables - 1
    } else if ( vote.results[[i]]$indiener.fractielid == "Indiener: R.J. Heerema, Tweede Kamerlid") {
      vote.results[[i]]$indiener.partij <- "VVD"
      vote.results[[i]]$unreadables <- vote.results[[i]]$unreadables - 1
    } else if ( vote.results[[i]]$indiener.fractielid == "Indiener: I.S.H. de Caluwé, Tweede Kamerlid") {
      vote.results[[i]]$indiener.partij <- "VVD"
      vote.results[[i]]$unreadables <- vote.results[[i]]$unreadables - 1
    } else if ( vote.results[[i]]$indiener.fractielid == "Indiener: T.R. van Dekken, Tweede Kamerlid") {
      vote.results[[i]]$indiener.partij <- "PvdA"
      vote.results[[i]]$unreadables <- vote.results[[i]]$unreadables - 1
    } else if ( vote.results[[i]]$indiener.fractielid == "Indiener: S.W. Dikkers, Tweede Kamerlid") {
      vote.results[[i]]$indiener.partij <- "PvdA"
      vote.results[[i]]$unreadables <- vote.results[[i]]$unreadables - 1
    } else if ( vote.results[[i]]$indiener.fractielid == "Indiener: S. Günal-Gezer, Tweede Kamerlid") {
      vote.results[[i]]$indiener.partij <- "PvdA"
      vote.results[[i]]$unreadables <- vote.results[[i]]$unreadables - 1
    } else if ( vote.results[[i]]$indiener.fractielid == "Indiener: V.A. Groot, Tweede Kamerlid") {
      vote.results[[i]]$indiener.partij <- "PvdA"
      vote.results[[i]]$unreadables <- vote.results[[i]]$unreadables - 1
    } else if ( vote.results[[i]]$indiener.fractielid == "Indiener: H. Neppérus, Tweede Kamerlid") {
      vote.results[[i]]$indiener.partij <- "VVD"
      vote.results[[i]]$unreadables <- vote.results[[i]]$unreadables - 1
    } else if ( vote.results[[i]]$indiener.fractielid == "Indiener: T.E. Siderius, Tweede Kamerlid") {
      vote.results[[i]]$indiener.partij <- "SP"
      vote.results[[i]]$unreadables <- vote.results[[i]]$unreadables - 1
    } else if ( vote.results[[i]]$indiener.fractielid == "Indiener: H.J.M. Leenders, Tweede Kamerlid") {
      vote.results[[i]]$indiener.partij <- "PvdA"
      vote.results[[i]]$unreadables <- vote.results[[i]]$unreadables - 1
    } else if ( vote.results[[i]]$indiener.fractielid == "Indiener: R.P. van Laar, Tweede Kamerlid") {
      vote.results[[i]]$indiener.partij <- "PvdA"
      vote.results[[i]]$unreadables <- vote.results[[i]]$unreadables - 1
    } else if ( vote.results[[i]]$indiener.fractielid == "Indiener: G.S.I.A. Tanamal, Tweede Kamerlid") {
      vote.results[[i]]$indiener.partij <- "PvdA"
      vote.results[[i]]$unreadables <- vote.results[[i]]$unreadables - 1
    } else if ( vote.results[[i]]$indiener.fractielid == "Indiener: Y. Cegerek, Tweede Kamerlid") {
      vote.results[[i]]$indiener.partij <- "PvdA"
      vote.results[[i]]$unreadables <- vote.results[[i]]$unreadables - 1
    } else if ( vote.results[[i]]$indiener.fractielid == "Indiener: R.E. van der Linde, Tweede Kamerlid") {
      vote.results[[i]]$indiener.partij <- "VVD"
      vote.results[[i]]$unreadables <- vote.results[[i]]$unreadables - 1
    } else if ( vote.results[[i]]$indiener.fractielid == "Indiener: A. Schut-Welkzijn, Tweede Kamerlid") {
      vote.results[[i]]$indiener.partij <- "VVD"
      vote.results[[i]]$unreadables <- vote.results[[i]]$unreadables - 1
    } else if ( vote.results[[i]]$indiener.fractielid == "Indiener: D.M. Samsom, Tweede Kamerlid") {
      vote.results[[i]]$indiener.partij <- "PvdA"
      vote.results[[i]]$unreadables <- vote.results[[i]]$unreadables - 1
    } else if ( vote.results[[i]]$indiener.fractielid == "Indiener: R.J. (Rudmer) Heerema, Tweede Kamerlid") {
      vote.results[[i]]$indiener.partij <- "VVD"
      vote.results[[i]]$unreadables <- vote.results[[i]]$unreadables - 1
    } else if ( vote.results[[i]]$indiener.fractielid == "Indiener: J. van Wijngaarden, Tweede Kamerlid") {
      vote.results[[i]]$indiener.partij <- "VVD"
      vote.results[[i]]$unreadables <- vote.results[[i]]$unreadables - 1
    } else if ( vote.results[[i]]$indiener.fractielid == "Indiener: Y. Berckmoes-Duindam, Tweede Kamerlid") {
      vote.results[[i]]$indiener.partij <- "VVD"
      vote.results[[i]]$unreadables <- vote.results[[i]]$unreadables - 1
    } else if ( vote.results[[i]]$indiener.fractielid == "Indiener: H.S. Veldman, Tweede Kamerlid") {
      vote.results[[i]]$indiener.partij <- "VVD"
      vote.results[[i]]$unreadables <- vote.results[[i]]$unreadables - 1
    } else if ( vote.results[[i]]$indiener.fractielid == "Indiener: L.A. de Lange, Tweede Kamerlid") {
      vote.results[[i]]$indiener.partij <- "VVD"
      vote.results[[i]]$unreadables <- vote.results[[i]]$unreadables - 1
    } else if ( vote.results[[i]]$indiener.fractielid == "Indiener: F. Teeven, Tweede Kamerlid") {
      vote.results[[i]]$indiener.partij <- "VVD"
      vote.results[[i]]$unreadables <- vote.results[[i]]$unreadables - 1
    } else if ( vote.results[[i]]$indiener.fractielid == "Indiener: J.G.P. Vermue, Tweede Kamerlid") {
      vote.results[[i]]$indiener.partij <- "PvdA"
      vote.results[[i]]$unreadables <- vote.results[[i]]$unreadables - 1
    } else if ( vote.results[[i]]$indiener.fractielid == "Indiener: J.C.M. Swinkels, Tweede Kamerlid") {
      vote.results[[i]]$indiener.partij <- "D66"
      vote.results[[i]]$unreadables <- vote.results[[i]]$unreadables - 1
    } else if ( vote.results[[i]]$indiener.fractielid == "Indiener: M.J.J. Volp, Tweede Kamerlid") {
      vote.results[[i]]$indiener.partij <- "PvdA"
      vote.results[[i]]$unreadables <- vote.results[[i]]$unreadables - 1
    } else if ( vote.results[[i]]$indiener.fractielid == "Indiener: A. van Miltenburg, Tweede Kamerlid") {
      vote.results[[i]]$indiener.partij <- "VVD"
      # was also 'voorzitter' of the meetings of parliament
      vote.results[[i]]$unreadables <- vote.results[[i]]$unreadables - 1
    } else if ( vote.results[[i]]$indiener.fractielid == "Indiener: P.J.M.J. Moors, Tweede Kamerlid") {
      vote.results[[i]]$indiener.partij <- "VVD"
      vote.results[[i]]$unreadables <- vote.results[[i]]$unreadables - 1
    } else if ( vote.results[[i]]$indiener.fractielid == "Indiener: D.A. van der Ree, Tweede Kamerlid") {
      vote.results[[i]]$indiener.partij <- "VVD"
      vote.results[[i]]$unreadables <- vote.results[[i]]$unreadables - 1
    } else if ( vote.results[[i]]$indiener.fractielid == "Indiener: K. Arib, Voorzitter van de Tweede Kamer") {
      vote.results[[i]]$indiener.partij <- "NOT APPLICABLE"
      vote.results[[i]]$unreadables <- vote.results[[i]]$unreadables - 1
    } else if ( vote.results[[i]]$indiener.fractielid == "Indiener: R. van der Velde, Tweede Kamerlid") {
      vote.results[[i]]$indiener.partij <- "PvdA"
      vote.results[[i]]$unreadables <- vote.results[[i]]$unreadables - 1
    } else if ( vote.results[[i]]$indiener.fractielid == "Indiener: R.P.G. (Remco) Bosma, Tweede Kamerlid") {
      vote.results[[i]]$indiener.partij <- "VVD"
      vote.results[[i]]$unreadables <- vote.results[[i]]$unreadables - 1
    } else if ( vote.results[[i]]$indiener.fractielid == "Indiener: A.A. Asante, Tweede Kamerlid") {
      vote.results[[i]]$indiener.partij <- "PvdA"
      vote.results[[i]]$unreadables <- vote.results[[i]]$unreadables - 1
    }
  }
}
