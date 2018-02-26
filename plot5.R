
source('getData.R')
library (ggplot2)

levels(factor(SCC$EI.Sector))
vehicle_codes = SCC[grep('[Vv]ehicle', SCC$EI.Sector),]

vehicle_emissions = NEI[NEI$SCC %in% vehicle_codes$SCC,]
BC_vehicle_emissions = vehicle_emissions[vehicle_emissions$fips=='24510',]

BC_vehicle_emission_aggregate = aggregate(BC_vehicle_emissions$Emissions, by=list(BC_vehicle_emissions$year), FUN=sum)

ggplot(BC_vehicle_emission_aggregate, aes(x=Group.1,y=x))+geom_line()+labs(x='Year', y="Total Vehicle Emissions", title = "Baltimore City vehicle emissions by year")

dev.copy(png, file='./figure/plot5.png')
dev.off()

