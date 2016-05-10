plot1<-function(){
  
  
  #open png device for printing graphs
  png(filename = "~/coursera/plot1.png", width=480, height=480, 
      bg="white")
  
    #create variable "names" for use in labeling columns of subset data
    #in a later step and create variable "fileName" to correspond to 
    #the raw datafile.
    names<-c("date", "time", "GlobalActivePower", "GlobalReactivePower", 
           "Voltage", "GlobalIntensity", "SubMetering1", "SubMetering2", 
           "SubMetering3")
   
    fileName<-"~/coursera/household_power_consumption.txt"
  
    #read in data, limiting rows to only those which correspond to the 
    #hourly readings on 2/1/2007 - 2/2/2007.  
    power<-read.table(fileName, sep=";",na.string="?",skip= 66637, 
                    nrows= 2880, col.names = names)
    
    #combine date and time variables and reformat
    paste<-paste(power$date, power$time, sep=" ")
    paste2<-strptime(paste, format="%d/%m/%Y %H:%M:%S")
    
    #plot Global Active Power vs frequency of value in a histogram
    hist(power$GlobalActivePower, freq=TRUE, col="red", 
       main="Global Active Power", xlab="Global Active Power (killowatts)")

   dev.off()
  
  
}