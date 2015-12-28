###
# Utils that will be used 
# in the main code thread 
###

library(stringr)

ensureCorporaIsDownloaded <- function(){

    linkToPackage <- "https://d396qusza40orc.cloudfront.net/dsscapstone/dataset/Coursera-SwiftKey.zip"
    langDataFolder = paste0(c("data", "en_US"), collapse = "/")
    tempFolder = '.tmp'
    packageDestination = paste0(c(tempFolder,"Coursera-SwiftKey.zip"), collapse = "/")
    dataFolderInsidePackage = paste0(c(tempFolder,"final"), collapse = "/")

    # Check if data was already downloaded
    if (!file.exists(langDataFolder)){
      
      # Check if file is already downloaded 
      if (!file.exists(packageDestination)){
        
        # Create .tmp dir to download the package
        if (!file.exists(tempFolder)){
          dir.create(tempFolder)
        }
      
        # Download zip file if we have no this in the system  
        download.file(
            linkToPackage, 
            packageDestination
        )
      }
      
      # Unzip file ito the .tmp folder 
      if (!file.exists(dataFolderInsidePackage)){
        unzip(
            packageDestination, 
            exdir = tempFolder
        )  
      }
      
      # Move all files from .tmp/final into data
      
      # Create data folder
      if (!file.exists("data")){
          dir.create("data")
      }
      
      # Copy files from .tmp into proper data folder
      langSubfolders <- list.dirs(dataFolderInsidePackage)
      for (subFolder in langSubfolders){
        
        if (subFolder != dataFolderInsidePackage){
          
          langPart = str_replace(subFolder, dataFolderInsidePackage, "")
          destFolder = paste0(c("data", langPart), collapse = "")
          
          file.copy(
            from = subFolder, 
            to = "data", 
            recursive = TRUE, 
            copy.mode = TRUE
          )
        }
      }
      
      # Remove .tmp folder
      unlink(
        tempFolder, 
        recursive = TRUE
      )
    }
}