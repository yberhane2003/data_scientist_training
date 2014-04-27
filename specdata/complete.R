complete <- function(mydir, indice = 1:332){
      hmpth <- "C:/coursera/data_scientist_training/"
      trgdir <-paste(hmpth,mydir, sep= "")
      setwd(trgdir)
      mylist <- indice
      myfile_list <- sprintf("%03d.csv", mylist)
      ##if (exists("myset")) {rm("myset")}
      myset <- data.frame(id= integer(0), nobs = integer(0))
      for (file in myfile_list)
      {
            
                  currentset<-read.table(file, header = TRUE, sep=",")
                  currentset <- na.omit(currentset)
                  newrow <- data.frame(id=c(currentset[1,4]),nobs=nrow(currentset))
                  myset = rbind(myset,newrow) 
                  rm(currentset)                       
      }
      myset
  
}
