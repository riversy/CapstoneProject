###
# Cleanup Helpers
###

removeSymbols <- function(corpus) {
    gsub(
        perl = TRUE, 
        pattern = '[\\]\\[\\(\\)-/+;:#%$^\\*=^~\\{\\}/"<>«»_\\\\“\\”⁰•‘’–]', 
        replacement = "", 
        corpus
    )
}

convertExclamationsToPoints <- function(corpus) {
    gsub(
        pattern = "[\\!\\?…]", 
        replacement = ".", 
        corpus
    ) 
}

removeDoublePoints <- function(corpus) {
    gsub(
        pattern = "[\\.]{2,}", 
        replacement = ".", 
        corpus
    )   
}

normalizeAnd <- function(corpus) {
    gsub(
        pattern = "&", 
        replacement = " and ", 
        corpus
    ) 
}



clearProfanity <- function(corpus) {
  
    profanityList <- profanityWords() 
  
    lists <- c(
      head(profanityList, length(profanityList) / 2),
      tail(profanityList, length(profanityList) / 2)
    )
    
    for (list in lists){
    
      corpus <- gsub(
        pattern = paste0(
          list, 
          collapse="|"
        ), 
        replacement = "", 
        corpus
      )   
    }
    
    corpus      
}

removeNumbers <- function(corpus) {
    gsub(
        pattern = "[0-9]+", 
        replacement = "", 
        corpus
    )
}

###
# Retrieves profanity words
###
profanityWords <- function(lang = "en_US"){

  # TODO: Add other languages support
  
  if (!exists("profanityList")){
    fileName <- paste(c("dictionary/profanity/", lang, ".txt"), collapse = "")
    
    profanityList <<- scan(
      fileName,
      what = "character",
      sep = "\n"
    )
  } 

  profanityList
}