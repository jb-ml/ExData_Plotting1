# Reading complete dataset
data <- read.csv("I:/courses/Exploratory_Data_Analysis/week_1/household_power_consumption.txt",
					header=T, sep=';', na.strings="?", check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

# Subsetting the data
sub_data <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

# Converting dates
datetime <- paste(as.Date(sub_data$Date), sub_data$Time)
sub_data$Datetime <- as.POSIXct(datetime)

# Plot 3
with(sub_data, {
    plot(Sub_metering_1~Datetime, type="l",
         ylab="Global Active Power (kilowatts)", xlab="")
    lines(Sub_metering_2~Datetime,col='Red')
    lines(Sub_metering_3~Datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Saving image
dev.copy(png, file="C:/Users/privat/Documents/workspace-sts-3.2.0.RELEASE/Exploratory_Data_Analysis/ExData_Plotting1/plot3.png", height=480, width=480)
dev.off()