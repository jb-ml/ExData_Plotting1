# Reading complete dataset
data <- read.csv("I:/courses/Exploratory_Data_Analysis/week_1/household_power_consumption.txt",
					header=T, sep=';', na.strings="?", check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

# Subsetting the data
sub_data <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

# Converting dates
datetime <- paste(as.Date(sub_data$Date), sub_data$Time)
sub_data$Datetime <- as.POSIXct(datetime)

# Saving image
plot(sub_data$Global_active_power~sub_data$Datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")
dev.copy(png, file="C:/Users/privat/Documents/workspace-sts-3.2.0.RELEASE/Exploratory_Data_Analysis/ExData_Plotting1/plot2.png", height=480, width=480)
dev.off()