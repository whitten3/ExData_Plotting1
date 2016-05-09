plot3<-function(){

  #open png device to create png file for the graph 
  png(file="~/coursera/plot3.png", width=480, height=480)

      #read in subset of data from source file to be used in the 
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

      #create variable "names" for use later in plot call
      names<-c("Sub_metering1", "Sub_metering_2", 
               "Sub_metering_3")
      
      #plot measurment data vs submetering data
      plot(paste2, power$submetering1, type="l", xlab="", 
          ylab="Energy sub metering")


      lines(paste2, power$submetering2, type="l", xlab="",
            ylab="",col="red")
      lines(paste2, power$submetering3, type="l", xlab="", 
             ylab="", col="blue")
      legend("topright", legend=names, pch="-", lwd=1, 
            col=c("black", "red", "blue"))
      
  #turn off png device    
  dev.off()
  
}
