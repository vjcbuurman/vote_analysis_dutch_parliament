ExtractInfo <- function(vote.info, i, k){
  #######################
  #Extract information  #
  
  null.elements <- 0
  
  #to be extracted:
  ###DESCRIPTION
  info.position <- grep('<h3>', vote.info)[1] #this is the identifier of where information about the description begins
  #this might consist of two, if it's the last vote of the page and contains another topic with a description but not a vote.
  info.position.end <- (grep('Indiener', vote.info)-1)[1]
  
  #three if else possibilities:
  #either the description is one line long
  #the description is two lines long
  #the description is three or more lines long
  
  if (info.position==info.position.end){ #one line: take everything between start and end markers
    info.start.pos <- head(unlist(gregexpr('">', vote.info[info.position])), 1)+2 #+2 because we want to start after the start of identifier string
    info.end.pos <- unlist(gregexpr('</a></h3>', vote.info[info.position.end]))-1
    if (length(info.start.pos)!=length(info.end.pos) | any(info.start.pos > info.end.pos)){
      warning(paste0(webpage.id, ": indexing of description wrong."))
    }
    description <- paste(strsplit(vote.info[info.position], split="")[[1]][info.start.pos:info.end.pos], collapse="")
  } else if (info.position==(info.position.end-1)){ #two lines: take everything of first line from start marker, take everying of second line untill end marker
    first.line.info.start.pos <- head(unlist(gregexpr('">', vote.info[info.position])), 1)+2 #+2 because we want to start after the start of identifier string
    first.line.info.end.pos <- nchar(vote.info[info.position])
    
    first.line <- paste(strsplit(vote.info[info.position], split="")[[1]][first.line.info.start.pos:first.line.info.end.pos], collapse="")
    
    last.line.info.start.pos <- head(unlist(gregexpr('[[:alnum:]]', vote.info[info.position.end])), 1)
    last.line.info.end.pos <- unlist(gregexpr('</a></h3>', vote.info[info.position.end]))-1
    if (last.line.info.start.pos > last.line.info.end.pos){ #may happen if last line is just blanks, and end identifiers.
      last.line <- ""
    } else {    
      last.line <- paste(strsplit(vote.info[info.position.end], split="")[[1]][last.line.info.start.pos:last.line.info.end.pos], collapse="")
    }
    #NO WARNING CODE IF SOMETHING GOES WRONG
    
    description <- paste(first.line, last.line, collapse=" ")
  } else { #three+ lines: take everything of first line from start marker, take everying of last line untill end marker, take everything of lines in between
    
    first.line.info.start.pos <- head(unlist(gregexpr('">', vote.info[info.position])), 1)+2 #+2 because we want to start after the start of identifier string
    first.line.info.end.pos <- nchar(vote.info[info.position])
    
    first.line <- paste(strsplit(vote.info[info.position], split="")[[1]][first.line.info.start.pos:first.line.info.end.pos], collapse="")
    
    in.between.lines <- info.position.end-info.position-1
    for (j in 1:in.between.lines){
      
      #basically removing leading blanks:
      in.between.info.start.pos <- head(unlist(gregexpr('[[:alnum:]]', vote.info[info.position+j])), 1)
      if (in.between.info.start.pos==-1){ #if no characters, then it's just blanks!
        in.between.lines[j] <- ""
      } else {
        in.between.info.end.pos <- nchar(vote.info[info.position+j])
        
        in.between.lines[j] <- paste(strsplit(vote.info[info.position+j], split="")[[1]][in.between.info.start.pos:in.between.info.end.pos], collapse="")  
      }
    }
    
    last.line.info.start.pos <- head(unlist(gregexpr('[[:alnum:]]', vote.info[info.position.end])), 1)
    last.line.info.end.pos <- unlist(gregexpr('</a></h3>', vote.info[info.position.end]))-1
    if (last.line.info.start.pos > last.line.info.end.pos){ #may happen if last line is just blanks, and end identifiers.
      last.line <- ""
    } else {    
      last.line <- paste(strsplit(vote.info[info.position.end], split="")[[1]][last.line.info.start.pos:last.line.info.end.pos], collapse="")
    }
    
    description <- paste(first.line, in.between.lines, last.line, collapse=" ")
  }
  
  ###Indiener (partij)
  info.position <- grep('Indiener', vote.info)[1]
  info.start.pos <- tail(unlist(gregexpr('">', vote.info[info.position])), 1)+2 #+2 because we want to start after the start of identifier string
  info.end.pos <- unlist(gregexpr('</a></p>', vote.info[info.position]))-1
  
  #Technical checks:
  if (length(info.position)==0 | 
        info.start.pos < 0 | 
        info.end.pos < 0 | #i.e. if any of the identifiers cannot be found
        info.start.pos > info.end.pos){ #if 
    null.elements <- null.elements+1
    extracted.info <- "NOT READABLE"
    # info.start.pos <- info.position+9
    # info.end.pos <- unlist(gregexpr('</p>', vote.info[info.position]))-1
    # extracted.info <- paste(strsplit(vote.info[info.position], split="")[[1]][info.start.pos:info.end.pos], collapse="")
    #if no party is given, simple extract the entire string (which usually gives a name and a function)
  } else { #checks passed, store whatever is between the identifiers
    extracted.info <- paste(strsplit(vote.info[info.position], split="")[[1]][info.start.pos:info.end.pos], collapse="")
  }
  
  indiener.partij <- extracted.info
  
  ###
  
  ###Fractielid
  info.position <- grep('Indiener', vote.info)[1]
  info.start.pos <- tail(unlist(gregexpr('">', vote.info[info.position])), 2)[-2]+2 #+2 because we want to start after the start of identifier string
  info.end.pos <- tail(unlist(gregexpr('</a>', vote.info[info.position])), 2)[-2]-1
  if (info.end.pos < 0){
    info.end.pos <- tail(unlist(gregexpr('</p>', vote.info[info.position])), 2)[-2]-1
  }
  
  if (length(info.position)==0 | 
        info.start.pos < 0 | 
        info.end.pos < 0 | #i.e. if any of the identifiers cannot be found
        info.start.pos > info.end.pos){ #if 
    null.elements <- null.elements+1
    extracted.info <- "NOT READABLE"
  } else { #checks passed, store whatever is between the identifiers
    extracted.info <- paste(strsplit(vote.info[info.position], split="")[[1]][info.start.pos:info.end.pos], collapse="")
  }
  
  indiener.fractielid <- extracted.info
  
  ###
  #TO DO
  #kabinet is not party like pvda or vvd, however, they posit things for votes as a single unit?
  #can be more efficient if we put indiener.fractielid before indiener.partij
  if (grepl("minister", indiener.fractielid) | grepl("staatssecretaris", indiener.fractielid)){
    indiener.partij <- "kabinet"
    null.elements <- null.elements-1
  }
  ###
  
  ### Besluit
  info.position <- grep('Besluit', vote.info)[1]
  info.start.pos <- unlist(gregexpr('<span>', vote.info[info.position]))+6 #+6 because we want to start after the start of identifier string
  info.end.pos <- unlist(gregexpr('</span>', vote.info[info.position]))-1
  
  if (length(info.position)==0 | 
        info.start.pos < 0 | 
        info.end.pos < 0 | #i.e. if any of the identifiers cannot be found
        info.start.pos > info.end.pos){ #if 
    null.elements <- null.elements+1
    extracted.info <- "NOT READABLE"
  } else { #checks passed, store whatever is between the identifiers
    extracted.info <- paste(strsplit(vote.info[info.position], split="")[[1]][info.start.pos:info.end.pos], collapse="")
  }
  
  besluit <- extracted.info
  
  ###id
  info.position <- (grep('search-result-properties', vote.info)+1)[1] #unique identifier for piece
  info.start.pos <- unlist(gregexpr('<p>', vote.info[info.position]))+3 #+3 because we want to start after the start of identifier string
  info.end.pos <- unlist(gregexpr('</p>', vote.info[info.position]))-1
  
  if (length(info.position)==0 | 
        info.start.pos < 0 | 
        info.end.pos < 0 | #i.e. if any of the identifiers cannot be found
        info.start.pos > info.end.pos){ #if 
    null.elements <- null.elements+1
    extracted.info <- "NOT READABLE"
  } else { #checks passed, store whatever is between the identifiers
    extracted.info <- paste(strsplit(vote.info[info.position], split="")[[1]][info.start.pos:info.end.pos], collapse="")
  }
  
  id <- extracted.info
  ###
  
  ###Date
  info.position <- grep('class="date"', vote.info)[1]
  info.start.pos <- unlist(gregexpr('"date">', vote.info[info.position]))+7 #+7 because we want to start after the start of identifier string
  info.end.pos <- unlist(gregexpr('</p>', vote.info[info.position]))-1
  
  if (length(info.position)==0 | 
        info.start.pos < 0 | 
        info.end.pos < 0 | #i.e. if any of the identifiers cannot be found
        info.start.pos > info.end.pos){ #if 
    null.elements <- null.elements+1
    extracted.info <- "NOT READABLE"
  } else { #checks passed, store whatever is between the identifiers
    extracted.info <- paste(strsplit(vote.info[info.position], split="")[[1]][info.start.pos:info.end.pos], collapse="")
  }
  
  date <- extracted.info
  ###
  
  ###Vote type
  info.position <- grep('vote-type', vote.info)
  info.start.pos <- unlist(gregexpr('<span>', vote.info[info.position]))+6 #+6 because we want to start after the start of identifier string
  info.end.pos <- unlist(gregexpr('</span>', vote.info[info.position]))-1
  
  if (length(info.position)==0 | 
        info.start.pos < 0 | 
        info.end.pos < 0 | #i.e. if any of the identifiers cannot be found
        info.start.pos > info.end.pos){ #if 
    null.elements <- null.elements+1
    extracted.info <- "NOT READABLE"
  } else { #checks passed, store whatever is between the identifiers
    extracted.info <- paste(strsplit(vote.info[info.position], split="")[[1]][info.start.pos:info.end.pos], collapse="")
  }
  
  vote.type <- extracted.info
  
  ###
  
  party.positions <- grep('class="fractie"', vote.info)[-1] #first one is html structure of table (which looks like:)
  #     <th class="fractie" scope="col">Fractie</th>
  #     <th class="zetels" scope="col">Zetels</th>
  #     <th class="voor" scope="col">voor</th>
  #     <th class="tegen" scope="col">tegen</th>
  #     <th class="details" scope="col">Details</th>
  party.number <- length(party.positions)
  
  #get starting position of party name
  info.positions <- party.positions
  info.start.pos <- numeric(party.number)
  for (j in 1:party.number){ #usually there are two, of which the last one is the interesting one, sometimes there is only 1
    info.start.pos[j] <- tail(gregexpr('">', vote.info[info.positions[j]])[[1]], 1)+2
  }
  #get end position of party name
  info.end.pos <- unlist(gregexpr('</a>', vote.info[info.positions]))-1
  #For those votes with not </a> to mark end, use </td> as end marker:
  info.end.pos[info.end.pos<0] <- unlist(gregexpr('</td>', vote.info[info.positions[info.end.pos<0]]))-1
  
  if (length(info.positions)==0 | 
        any(info.start.pos < 0) | 
        any(info.end.pos < 0) | #i.e. if any of the identifiers cannot be found
        any(info.start.pos > info.end.pos) |
        length(info.start.pos)!=length(info.end.pos)){ #if 
    null.elements <- null.elements+1
    extracted.info <- "NOT READABLE"
  } else { #checks passed, store whatever is between the identifiers
    extracted.info <- numeric(party.number)
    for (j in 1:party.number){
      extracted.info[j] <- paste(strsplit(vote.info[info.positions[j]], split="")[[1]][info.start.pos[j]:info.end.pos[j]], collapse="")
    }
  }
  
  party.names <- extracted.info
  
  
  #number of seats
  if (vote.type=="Met handopsteken"){
    info.positions <- party.positions+1
    info.start.pos <- unlist(gregexpr('<td>', vote.info[info.positions]))+4 #+4 (length of string "<td>") because we want to start after the start of identifier string
    info.end.pos <- unlist(gregexpr('</td>', vote.info[info.positions]))-1
    
    if (length(info.positions)==0 | 
        any(info.start.pos < 0) | 
        any(info.end.pos < 0) | #i.e. if any of the identifiers cannot be found
        any(info.start.pos > info.end.pos) |
        length(info.start.pos)!=length(info.end.pos)){ #if 
      null.elements <- null.elements+1
      extracted.info <- "NOT READABLE"
    } else { #checks passed, store whatever is between the identifiers
      extracted.info <- numeric(party.number)
      for (j in 1:party.number){
        extracted.info[j] <- paste(strsplit(vote.info[info.positions[j]], split="")[[1]][info.start.pos[j]:info.end.pos[j]], collapse="")
      }
    }
  } else if (vote.type=="Hoofdelijk"){
    info.positions <- party.positions+1
    info.start.pos <- unlist(gregexpr('href="#">', vote.info[info.positions]))+9 #+8 because we want to start after the start of identifier string
    info.end.pos <- unlist(gregexpr('</a></td>', vote.info[info.positions]))-1
    
    if (length(info.positions)==0 | 
        any(info.start.pos < 0) | 
        any(info.end.pos < 0) | #i.e. if any of the identifiers cannot be found
        any(info.start.pos > info.end.pos) |
        length(info.start.pos)!=length(info.end.pos)){ #if 
      null.elements <- null.elements+1
      extracted.info <- "NOT READABLE"
    } else { #checks passed, store whatever is between the identifiers
      extracted.info <- numeric(party.number)
      for (j in 1:party.number){
        extracted.info[j] <- paste(strsplit(vote.info[info.positions[j]], split="")[[1]][info.start.pos[j]:info.end.pos[j]], collapse="")
      }
    }
  }
  
  number.seats <- extracted.info
  
  ###
  
  #votes in favor
  info.positions <- party.positions+2 #determines the line on which we will find the right data
  info.start.pos <- unlist(gregexpr('width="', vote.info[info.positions]))+7 #+7 because we want to start after the start of identifier string
  #if no votes in favor, info.start.pos will be -1 for those parties. (but 6 because of +7)
  info.end.pos <- unlist(gregexpr('" class="v', vote.info[info.positions]))-1
  info.end.pos[info.start.pos==6] <- 6 #a 6 indicates no data on votes in favor (i.e. empty i.e. 0)
  
  if (length(info.positions)==0 | 
        any(info.start.pos < 0) | 
        any(info.end.pos < 0) | #i.e. if any of the identifiers cannot be found
        any(info.start.pos > info.end.pos) |
        length(info.start.pos)!=length(info.end.pos)){ #if 
    null.elements <- null.elements+1
    extracted.info <- "NOT READABLE"
  } else { #checks passed, store whatever is between the identifiers
    extracted.info <- numeric(party.number)
    for (j in 1:party.number){
      extracted.info[j] <- paste(strsplit(vote.info[info.positions[j]], split="")[[1]][info.start.pos[j]:info.end.pos[j]], collapse="")
    }
  }
  extracted.info[extracted.info==" "] <- "0"
  
  votes.favor <- extracted.info
  
  #votes against
  info.positions <- party.positions+3
  info.start.pos <- unlist(gregexpr('width="', vote.info[info.positions]))+7 #+7 because we want to start after the start of identifier string
  #if no votes in favor, info.start.pos will be -1 for those parties. (but 6 because of +7)
  info.end.pos <- unlist(gregexpr('" class="v', vote.info[info.positions]))-1
  info.end.pos[info.start.pos==6] <- 6 #a 6 indicates no data on votes in favor (i.e. empty i.e. 0)
  
  if (length(info.positions)==0 | 
        any(info.start.pos < 0) | 
        any(info.end.pos < 0) | #i.e. if any of the identifiers cannot be found
        any(info.start.pos > info.end.pos) |
        length(info.start.pos)!=length(info.end.pos)){ #if 
    null.elements <- null.elements+1
    extracted.info <- "NOT READABLE"
  } else { #checks passed, store whatever is between the identifiers
    extracted.info <- numeric(party.number)
    for (j in 1:party.number){
      extracted.info[j] <- paste(strsplit(vote.info[info.positions[j]], split="")[[1]][info.start.pos[j]:info.end.pos[j]], collapse="")
    }
  }
  extracted.info[extracted.info==" "] <- "0"
  
  votes.against <- extracted.info
  ###
  
  ###Voting result
  if (vote.type=="Met handopsteken"){ #with handopsteken, both below are not recorded
    votes.notpartaken <- numeric(party.number)
    votes.mistake <- numeric(party.number)
  } else if (vote.type=="Hoofdelijk"){
    
    "Niet deelgenomen"
    info.positions <- party.positions+4
    info.start.pos <- unlist(gregexpr('width="', vote.info[info.positions]))+7 #+7 because we want to start after the start of identifier string
    #if no votes in favor, info.start.pos will be -1 for those parties. (but 6 because of +7)
    info.end.pos <- unlist(gregexpr('" class="v', vote.info[info.positions]))-1
    info.end.pos[info.start.pos==6] <- 6 #a 6 indicates no data on votes in favor (i.e. empty i.e. 0)
    
    if (length(info.positions)==0 | 
        any(info.start.pos < 0) | 
        any(info.end.pos < 0) | #i.e. if any of the identifiers cannot be found
        any(info.start.pos > info.end.pos) |
        length(info.start.pos)!=length(info.end.pos)){ #if 
      null.elements <- null.elements+1
      extracted.info <- "NOT READABLE"
    } else { #checks passed, store whatever is between the identifiers
      extracted.info <- numeric(party.number)
      for (j in 1:party.number){
        extracted.info[j] <- paste(strsplit(vote.info[info.positions[j]], split="")[[1]][info.start.pos[j]:info.end.pos[j]], collapse="")
      }
    }
    extracted.info[extracted.info==" "] <- "0"
    
    votes.notpartaken <- extracted.info 
    
    #"Vergissing"
    info.positions <- party.positions+5
    info.start.pos <- unlist(gregexpr('width="', vote.info[info.positions]))+7 #+7 because we want to start after the start of identifier string
    #if no votes in favor, info.start.pos will be -1 for those parties. (but 6 because of +7)
    info.end.pos <- unlist(gregexpr('" class="v', vote.info[info.positions]))-1
    info.end.pos[info.start.pos==6] <- 6 #a 6 indicates no data on votes in favor (i.e. empty i.e. 0)
    
    if (length(info.positions)==0 | 
        any(info.start.pos < 0) | 
        any(info.end.pos < 0) | #i.e. if any of the identifiers cannot be found
        any(info.start.pos > info.end.pos) |
        length(info.start.pos)!=length(info.end.pos)){ #if 
      null.elements <- null.elements+1
      extracted.info <- "NOT READABLE"
    } else { #checks passed, store whatever is between the identifiers
      extracted.info <- numeric(party.number)
      for (j in 1:party.number){
        extracted.info[j] <- paste(strsplit(vote.info[info.positions[j]], split="")[[1]][info.start.pos[j]:info.end.pos[j]], collapse="")
      }
    }
    extracted.info[extracted.info==" "] <- "0"
      
    votes.mistake <- extracted.info 
  }
  
  #######################
  
  
  #THIS IS PER VOTE (MIGHT BE MULTIPLE VOTES PER PAGE!)
  voting.information <- list(page.number=i,
                             vote.number=k,
                             vote.id=id,
                             unreadables=null.elements,
                             description=description,
                             date=date,
                             indiener.partij=indiener.partij,
                             indiener.fractielid=indiener.fractielid,
                             besluit=besluit,
                             vote.type=vote.type,
                             voting.results=data.frame(party.names, number.seats, votes.favor, votes.against, votes.notpartaken, votes.mistake))
  
  return(voting.information)
}