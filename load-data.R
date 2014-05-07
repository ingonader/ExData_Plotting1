## ############################################################################
## Data Science Curriculum
## Exploratory Data Analysis
## Assignment: Exploratory Plots
## ############################################################################

## ============================================================================
## load packages
## ============================================================================

#rm(list=ls())

library(downloader) ## for download() function
library(gdata)      ## ll() for checking size of objects in workspace

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
## download and unzip data (if necessary)
## ============================================================================

## [[?]]

url <- ""
filename.zipped <- "exdata_data_household_power_consumption.zip"
filename.unzipped <- "household_power_consumption.txt"

if (!file.exists(filename.unzipped)) {
	if (!file.exists(filename.zipped)) {
		download(url=url, destfile=filename.zipped, quiet=FALSE)
	} else {
		message(paste0("File '", filename.zipped, "' found, using this file."))
	}
	message(paste0("Unzipping file '", filename.zipped, "'..."))
	unzip(zipfile=filename.zipped)
	message("Done.")
} else {
	message(paste0("File '", filename.unzipped, "' found, assuming data was already unzipped."))
}

## ============================================================================
## perform memory calculation before loading
## ============================================================================

size.date <- 10 # bytes, because is string when read
size.time <- 8 # bytes, because is string when read
size.numeric <- 8 # bytes

## estimated size:
(size.date + size.time + 7 * size.numeric) * 2075259
# [1] 153569166
# --> 153 mb, shouldn't be a problem

## ============================================================================
## load data
## ============================================================================

dat.all <- read.table(file=filename.unzipped, header=TRUE, sep=";",
		na.strings="?",	nrows=2100000, stringsAsFactors=FALSE)

names(dat.all) <- tolower(names(dat.all)) ## for convenience, all lower case names

## inspect size:
ll() ## dat.all has 146 mb

## inspect data:
dim(dat.all)
head(dat.all)
str(dat.all)

## ============================================================================
## select a subset of the data 
## ============================================================================

## do this right after reading the data to for speed and memory considerations
dat.sel <- subset(dat.all, subset=(dat.all$date %in% c("1/2/2007", "2/2/2007")))
dim(dat.sel)

## ============================================================================
## remove unused data from workspace
## ============================================================================

rm(dat.all)

## ============================================================================
## preprocess data 
## ============================================================================

## create new variable datetime (transform strings to dates):
dat.sel$datetime <- as.POSIXct(strptime(paste(dat.sel$date, dat.sel$time), format="%d/%m/%Y %H:%M:%S"))

## inspect data:
str(dat.sel)

## check size again:
ll()

