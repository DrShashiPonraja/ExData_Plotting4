if (!file.exists('./data/summarySCC_PM25.rds')){
  URL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
  download.file(URL, destfile = "./data/EPA FPM Data.zip", method="curl")
  unzip('./data/EPA FPM Data.zip', exdir="./data/")
  
}

NEI <- readRDS("./data/summarySCC_PM25.rds")
SCC <- readRDS("./data/Source_Classification_Code.rds")
