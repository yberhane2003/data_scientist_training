corr <- function(mydir, treshold = 0, indice = 1:332){
      hmpth <- "C:/coursera/data_scientist_training/"
      trgdir <-paste(hmpth,mydir, sep= "")
      setwd(trgdir)
      mylist <- indice
      myfile_list <- sprintf("%03d.csv", mylist)
      
      mycorr <- numeric()
      for (file in myfile_list)
      {
            
            currentset<-read.table(file, header = TRUE, sep=",")
            currentset <- na.omit(currentset)
            if (nrow(currentset) > treshold)
            {
                  nitrate <- currentset[, "nitrate"]
                  sulfate <- currentset[, "sulfate"]
                  current_cor <- cor(nitrate,sulfate)
                  mycorr[length(mycorr)+1] <- current_cor
                  rm(current_cor)
            }
            
            rm(currentset)                       
      }
      mycorr
      
}