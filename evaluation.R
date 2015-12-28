###
# This file text evaluation helpers 
###

library(openNLP)
library(tm) 
library(qdap)
library(RWeka)
library(stringr)

###
# Retireves count of characters in the text 
#
# @param text character vector or just text
###
getCharacterCount <- function(text){
    str_length(text)
}

###
# Retireves count of words in the text 
#
# @param text character vector or just text
###
getWordsCount <- function(text){
    word_count(text)
}

###
# Retireves count of sentences in the text 
#
# @param text character vector or just text
###
getSentencesCount <- function(text){

    lenghts <- integer(0)
  
    for (i in 1:length(text)){
      sentences <- sent_detect(text[i], language = "en") 
      lenghts[i] <- length(sentences)
    }
    
    lenghts
}



