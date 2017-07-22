rm(list=ls())

# put your own wd here:
wd <- "~Desktop/vote_analysis/read"
webpages.wd <- "~/Desktop/vote_analysis/webpages"

setwd(wd)#Read data from html files.

source("extract_info.R")

#Different files: (search-result_category "Wetgeving")

# first check if any pages failed to download
# then you need to manually redownload these
years <- c(2013:2016)
failed_download_pages <- character(0)
for (y in 1:length(years)){
  year <- years[y]
  total.number.pages <- 2.5e4
  valid.webpages <- numeric(total.number.pages)
  unavailable <- numeric(total.number.pages)
  
  vote.number <- 0
  vote.results <- list()
  vote.pages <- NULL
  
  for (i in 1:total.number.pages){
    #for (i in c(544, 705, 6220)){
    if (i >= 1e4){
      webpage.id <- paste0(year, "P", i)
    } else if (i >= 1e3){
      webpage.id <- paste0(year, "P0", i)
    } else if (i >= 1e2) {
      webpage.id <- paste0(year, "P00", i)
    } else if (i >= 1e1) {
      webpage.id <- paste0(year, "P000", i)
    } else {
      webpage.id <- paste0(year, "P0000", i)
    }
    
    #file.name <- paste0(webpages.wd, "/", webpage.id, ".txt")
    file.name <- paste0(webpages.wd, "/", webpage.id)
    
    if(is.na(file.size(file.name))){
      failed_download_pages <- c(failed_download_pages, file.name) 
    }
  }
}

results.per.year <- list()
for (y in 1:length(years)){
  year <- years[y]
  total.number.pages <- 2.5e4
  valid.webpages <- numeric(total.number.pages)
  unavailable <- numeric(total.number.pages)
  
  vote.number <- 0
  vote.results <- list()
  vote.pages <- NULL
  
  for (i in 1:total.number.pages){
    #for (i in c(544, 705, 6220)){
    if (i >= 1e4){
      webpage.id <- paste0(year, "P", i)
    } else if (i >= 1e3){
      webpage.id <- paste0(year, "P0", i)
    } else if (i >= 1e2) {
      webpage.id <- paste0(year, "P00", i)
    } else if (i >= 1e1) {
      webpage.id <- paste0(year, "P000", i)
    } else {
      webpage.id <- paste0(year, "P0000", i)
    }
    
    #file.name <- paste0(webpages.wd, "/", webpage.id, ".txt")
    file.name <- paste0(webpages.wd, "/", webpage.id)
    
    webpage <- readLines(file.name)
    page.length <- length(webpage)
    
    #############################################################
    # Determine the amount of votes on this particular webpage  #
    # (may be multiple)
    vote.positions <- grep('class="vote-result"', webpage) #marks (approximate start) places of votes
    
    class.start.positions <- grep("<div class=", webpage)
    end.marker.positions <- grep('<li', webpage) #marks start position of next html element (thus can be used as upper limit to end) (<li> and <li class ...)
    #vote falls within one <li object, so start of next <li object marks also the end of the previous vote element
    search.positions <- grep('search-result-content', webpage) #marks (exact) start of piece of webpage that contains votes
    votes <- length(vote.positions)
    
    if (votes > 0){
      vote.pages <- c(vote.pages, i)
      start.positions <- numeric(votes)
      end.positions <- numeric(votes)
      for (k in 1:votes){
        #take as starting position of a particular piece of voting structure the search-result-content identifier
        #that is smaller than and closest to the vote position
        start.positions[k] <- search.positions[tail(which(search.positions<vote.positions[k]), 1)]
        #end.positions[k] <- end.marker.positions[head(which(end.marker.positions > start.positions[k]), 1)]-1 #-1 because positions marks start
        end.positions[k] <- end.marker.positions[head(which(end.marker.positions > start.positions[k]), 1)]-1 #-1 because positions marks start
        end.positions[k] <- end.marker.positions[head(which(end.marker.positions > start.positions[k]), 1)]-2 #-2 because position marks start of next html element, 
        #sometimes extra line for last element, if not than unnecessary end html statement is `lost' because not read.
      }
      
      for (k in 1:votes){ #go through all the votes of the document
        
        vote.number <- vote.number+1
        
        start.pos <- start.positions[k]
        if (k==votes){
          end.pos <- length(webpage)
        } else {
          #end point is smallest div class after vote result class
          end.pos <- end.positions[k] #up until right before the next html element
        }
        
        vote.info <- webpage[start.pos:end.pos] #this contains all the rows with info particular to a piece on which was voted
        
        print(i); print(k)
        vote.results[[vote.number]] <- ExtractInfo(vote.info, i, k)
        vote.results[[vote.number]] <- c("filename"=webpage.id, vote.results[[vote.number]])
      }
    }
  }
  results.per.year[[y]] <- vote.results
}


#put all the years into one big list:
final.result <- list()
k <- 1
for (i in 1:length(results.per.year)){
  for (j in 1:length(results.per.year[[i]])){
    final.result[[k]] <- results.per.year[[i]][[j]]
    k <- k+1
  }
}

# save the result for analysis use
save(final.result, file="results.RData")


