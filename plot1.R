
setwd("E:\\Coursera\\Data Specialisation\\Exploratory Data Analysis\\Project1")

if (!file.exists("household_power_consumption.txt"))
{
  # download the file and extract
  url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  destfile <- "household_power_consumption.zip"
  download.file(url, destfile)
  #file has been downloaded, now extract 
  unzip(destfile)
}


##use findstr to get the rows containing dates from 1 to 2 Februaury 2007 inclusive
#read first column of file to get the column names, easier to work with names rather than indexes

data <- read.table(pipe('findstr /B /R ^[1-2]/2/2007 household_power_consumption.txt'),header=F, sep=';') 
colnames(data) <-names(read.table('household_power_consumption.txt', header=TRUE,sep=";",nrows=1))

#set the parameters for png, draw the histogram and turn off the device to save the file.

png ( "plot1.png", 
      width = 480,
      height = 480,
      units = "px"
)

with ( data, 
       hist ( Global_active_power, 
              main = "Global Active Power", 
              xlab = "Global Active Power (kilowatts)",
              col = "red" 
       )
)
dev.off()