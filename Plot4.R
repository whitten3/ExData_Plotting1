plot4<-function(){
  #create variable names for use later in plot call
  names<-c("Sub_metering1", "Sub_metering_2", 
           "Sub_metering_3")
  
  #open png device
  png("~/coursera/plot4.png", width=480, height=480)

    #read subset of data from source file for use in each plot 
    power<-read.table("~/coursera/household_power_consumption.txt",
            sep=";", na.strings = "?", skip=66637 , 
            nrows=2880, col.names = c("date", "time", 
            "globalactivepower", "globalreactivepower", 
            "voltage", "globalintensity", "submetering1", 
            "submetering2", "submetering3")) 
    
    #combine date and time variables and reformat
    paste<-paste(power$date, power$time, sep=" ")
    paste2<-strptime(paste, format="%d/%m/%Y %H:%M:%S")

    #set up plot field and plot each of 4 required graphs
    par(mfrow=c(2,2))

    plot(paste2, power$globalactivepower, type="l", xlab="", 
            ylab="Global Active Power (kilowatts)")

    plot(paste2, power$voltage, type="l", xlab="datetime", 
            ylab="Voltage")
            axis(2, at=c(234, 236,238, 240,242,244, 246), 
            labels=c(234, "", 238, "",242,"" ,246))


    plot(paste2, power$submetering1, type="l", xlab="", 
            ylab="Energy sub metering")

    lines(paste2, power$submetering2, type="l", xlab="", 
             ylab="", col="red")
    lines(paste2, power$submetering3, type="l", xlab="", 
             ylab="", col="blue")
    legend("topright", legend=names, pch="-", lwd=1, 
             col=c("black", "red", "blue"), bty="n")

    plot(paste2, power$globalreactivepower, type="l", 
            xlab="datetime",ylab="Global_reactive_power")

  #turn off png device  
  dev.off()

}

