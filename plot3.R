## ############################################################################
## Data Science Curriculum
## Exploratory Data Analysis
## Assignment: Exploratory Plots
## ############################################################################

## ============================================================================
## global variables
## ============================================================================

## define paths to analysis file and data:
path.raw <- "C:/data-sync/coursera/data-scientist-04-exploratory-data-analysis/assignment/"

## setwd(path.raw)

## [[note]]: 
## The script assumes that the data file is contained in the current R 
## working directory. If it is not found there, it will be downloaded again
## into the current R working directory.
## Working directory needs to be set with setwd() before running this script,
## in case it is sourced by another R script (otherwise, current working dir
## would be "reset" to the value hard-coded here)

## ============================================================================
## load data (in other script file)
## ============================================================================

source("load-data.R")


## ============================================================================
## Plot 3
## ============================================================================

## set locale to US/English (for days of week in plot ticks):
Sys.setlocale(category="LC_TIME", locale="US")

## define variables to plot and colors:
varnames <- c("sub_metering_1", "sub_metering_2", "sub_metering_3")
cols <- c("black", "red", "blue")

## open device:
png(filename="plot3.png", width=480, height=480)

## initialize plot:
plot(apply(dat.sel[varnames], 1, max) ~ dat.sel$datetime, 
		ylab="Energy sub metering", 
		xlab="",
		type="n")

## plot time series sub_metering_1:
lines(dat.sel[[varnames[1]]] ~ dat.sel$datetime, col=cols[1])

## plot time series sub_metering_2:
lines(dat.sel[[varnames[2]]] ~ dat.sel$datetime, col=cols[2])

## plot time series sub_metering_3:
lines(dat.sel[[varnames[3]]] ~ dat.sel$datetime, col=cols[3])

## add legend:
legend("topright", lty=1, col=cols, legend=varnames)

## close device:
dev.off()

