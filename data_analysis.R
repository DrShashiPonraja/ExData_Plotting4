source('getData.R')

NEI <- readRDS("./data/summarySCC_PM25.rds")
SCC <- readRDS("./data/Source_Classification_Code.rds")

total_emissions_by_year = aggregate(NEI$'Emissions', by=list(Category=NEI$'year'), FUN=sum)

plot(total_emissions_by_year$Category, total_emissions_by_year$x, xlab="Year", ylab="Total Emissions", main = "Total Emissions by Year")
lines(total_emissions_by_year$Category, total_emissions_by_year$x)

dev.copy(png, file='./figure/plot1.png')
dev.off()

emissions_in_Baltimore_City = NEI[NEI$fips == '24510',]

Baltimore_City_emissions_by_year = aggregate(emissions_in_Baltimore_City$'Emissions', by=list(Category=emissions_in_Baltimore_City$'year'), FUN=sum)
plot(Baltimore_City_emissions_by_year$Category, Baltimore_City_emissions_by_year$x, xlab="Year", ylab="Total Emissions", main = "Baltimore City Total Emissions by Year")
lines(Baltimore_City_emissions_by_year$Category, Baltimore_City_emissions_by_year$x)

dev.copy(png, file='./figure/plot2.png')
dev.off()


par(mfrow=c(2,2))

BC_NON_ROAD_emissions = emissions_in_Baltimore_City[emissions_in_Baltimore_City$type=='NON-ROAD',]
BC_ON_ROAD_emissions = emissions_in_Baltimore_City[emissions_in_Baltimore_City$type=='ON-ROAD',]
BC_NONPOINT_emissions = emissions_in_Baltimore_City[emissions_in_Baltimore_City$type=='NONPOINT',]
BC_POINT_emissions = emissions_in_Baltimore_City[emissions_in_Baltimore_City$type=='POINT',]

BC_NON_ROAD_aggregates = aggregate(BC_NON_ROAD_emissions$'Emissions', by=list(Category=BC_NON_ROAD_emissions$'year'), FUN=sum)
plot(BC_NON_ROAD_aggregates$Category, BC_NON_ROAD_aggregates$x, xlab="Year", ylab="Total Emissions", main = "Baltimore City Non Road Emissions by year")
lines(BC_NON_ROAD_aggregates$Category, BC_NON_ROAD_aggregates$x)

BC_ON_ROAD_aggregates = aggregate(BC_ON_ROAD_emissions$'Emissions', by=list(Category=BC_ON_ROAD_emissions$'year'), FUN=sum)
plot(BC_ON_ROAD_aggregates$Category, BC_ON_ROAD_aggregates$x, xlab="Year", ylab="Total Emissions", main = "Baltimore City On Road Emissions by year")
lines(BC_ON_ROAD_aggregates$Category, BC_ON_ROAD_aggregates$x)

BC_NONPOINT_aggregates = aggregate(BC_NONPOINT_emissions$'Emissions', by=list(Category=BC_NONPOINT_emissions$'year'), FUN=sum)
plot(BC_NONPOINT_aggregates$Category, BC_NONPOINT_aggregates$x, xlab="Year", ylab="Total Emissions", main = "Baltimore City NONPOINT Emissions by year")
lines(BC_NONPOINT_aggregates$Category, BC_NONPOINT_aggregates$x)

BC_POINT_aggregates = aggregate(BC_POINT_emissions$'Emissions', by=list(Category=BC_POINT_emissions$'year'), FUN=sum)
plot(BC_POINT_aggregates$Category, BC_POINT_aggregates$x, xlab="Year", ylab="Total Emissions", main = "Baltimore City POINT Emissions by year")
lines(BC_POINT_aggregates$Category, BC_POINT_aggregates$x)

dev.copy(png, file='./figure/plot3.png')
dev.off()
library (ggplot2)

BC_Emissions_by_type_year = aggregate(emissions_in_Baltimore_City$'Emissions',by=list(emissions_in_Baltimore_City$'type',emissions_in_Baltimore_City$'year'),  FUN=sum)


plot3 = ggplot(BC_Emissions_by_type_year, aes(x=Group.2, y=x, color=Group.1))+geom_line()
plot3 = plot3 +labs(color='Type', x='Year', y='Emissions', title='Total emissions per year in Baltimore City')
plot3
