################################################################
# get_tidy_data.R
################################################################


if( !file.exists("household_power_consumption.txt"))
{
  furl<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"

  download.file(furl,destfile="household_power_consuption.zip",method="curl")

  unzip(zipfile="household_power_consuption.zip",overwrite=TRUE)
}

#get file handle
con<-file("household_power_consumption.txt",open="r")

# initialize storage object
df<-NULL

# save header for input
hdr<-c(strsplit(readLines(con,n=1),";")[[1]])
#print(hdr)

# read through data input until end
while( length(rl<-readLines(con,n=1)) > 0){ 
 n<-strsplit(rl,";")
  # filter out lines with NA,
 # for this assignment, NA == ?
 if(length(grep(n,"?")>0)) {
   print("found NA character")
   next
 }
 
 if(n[[1]][1] == "1/2/2007" || n[[1]][1] == "2/2/2007"){ 
   df<-rbind(df,n[[1]])
   #print(n)
 }
 
 # assuming that original source is presorted, stop 
 # processing  input stream with data range is violated
 if(n[[1]][1] == "2/3/2007"){
   colnames(df)=hdr
   break
 }
} 

# refactor the results
df<-data.frame(df,stringsAsFactors = TRUE)

# convert first column to date format
df$Date <- as.Date(strptime(df$Date,format="%d/%m/%Y",tz= ""))
df$Date <- as.Date(df$Date)
df$Time <- as.POSIXct(strptime(paste(df$Date, ' ', df$Time), '%Y-%m-%d %H:%M:%S'))

#write.table(df,file="processed.txt")

# close file handle
close(con)
