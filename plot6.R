
source('getData.R')
library (ggplot2)

levels(factor(SCC$EI.Sector))
vehicle_codes = SCC[grep('[Vv]ehicle', SCC$EI.Sector),]

vehicle_emissions = NEI[NEI$SCC %in% vehicle_codes$SCC,]
BCLA_vehicle_emissions = vehicle_emissions[vehicle_emissions$fips %in% c('24510','06037'),]

BCLA_vehicle_emission_aggregate = aggregate(BCLA_vehicle_emissions$Emissions, by=list(BCLA_vehicle_emissions$year,BCLA_vehicle_emissions$fips), FUN=sum)
BCLA_vehicle_emission_aggregate
ggplot(BCLA_vehicle_emission_aggregate, aes(x=Group.1,y=x, color=Group.2))+geom_line()+labs(color='State',x='Year', y="Total Vehicle Emissions", title = "Balt City vs LA County vehicle emissions by year")

dev.copy(png, file='./figure/plot6.png')
dev.off()
