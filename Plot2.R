plot2<-function(){
  
  #open png device for creation of png file for this plot 
  #and save to working directory
  png(file="~/coursera/plot2.png", width=480, height=480)

      #read in subset of data from source file to be used for
      #creation of plot
      power<-read.table("~/coursera/household_power_consumption.txt",
              sep=";", na.strings = "?", skip=66637 , 
              nrows=2880, col.names = c("date", "time", 
              "globalactivepower", "globalreactivepower", 
              "voltage", "globalintensity", "submetering1", 
              "submetering2", "submetering3")) 

      #combine date and time variables and reformat
      paste<-paste(power$date, power$time, sep=" ")
      paste2<-strptime(paste, format="%d/%m/%Y %H:%M:%S")
  
      #plot each measurement vs "global active power"
      plot(paste2, power$globalactivepower, type="l", xlab="", 
           ylab="Global Active Power (kilowatts)")
  
  #turn off png device    
  dev.off()

}
