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
## Plot 2
## ============================================================================

## set locale to US/English (for days of week in plot ticks):
Sys.setlocale(category="LC_TIME", locale="US")

## open device:
png(filename="plot2.png", width=480, height=480)

## plot time series:
plot(dat.sel$global_active_power ~ dat.sel$datetime, 
		ylab="Global Active Power (kilowatts)", 
		xlab="",
		type="l")

## close device:
dev.off()

