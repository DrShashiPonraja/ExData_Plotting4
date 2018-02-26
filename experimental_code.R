source('getData.R')

NEI <- readRDS("./data/summarySCC_PM25.rds")
SCC <- readRDS("./data/Source_Classification_Code.rds")

head (NEI)
head (SCC)

class(NEI)
class (SCC)
colnames(NEI)
colnames(SCC)

NEI$'year'

ncol(NEI[NEI$'year'==2008,])

aggregate(NEI$'Emissions', by=list(Category=NEI$'year'), FUN=sum)
hist(AirPassengers)
AirPassengers

colnames(NEI)
factor(NEI$type)

z=SCC$Short.Name[grep('[Mm]otor', SCC$Short.Name)]
z
