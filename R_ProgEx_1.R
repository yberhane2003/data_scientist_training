
pollutantmean <- function(mydir,elmnt ="nitrate", indice){
      hmpth <- "C:/coursera/data_scientist_training/"
      trgdir <-paste(hmpth,mydir, sep= "")
      setwd(trgdir)
      mylist <- indice
      myfile_list <- sprintf("%03d.csv", mylist)
      if (exists("myset")) {rm("myset")}
      for (file in myfile_list)
      {
            if (!exists("myset"))
            {
                  myset<-read.table(file, header = TRUE, sep=",")
            }
            else{
                  currentset<-read.table(file, header = TRUE, sep=",")
                  myset<-rbind(myset, currentset)
                  rm(currentset)
                  
            }
            
      }
      ##myset <-myset[,myset$eval(elmnt)]
      myset <-as.data.frame(myset[[elmnt]])
      lapply(myset,na.rm = TRUE, mean)
      ##lapply(subset(myset, select=c(nitrate)),na.rm = TRUE, mean)          
      ##return(myset)
      
}
