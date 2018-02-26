source('getData.R')
library (ggplot2)
emissions_in_Baltimore_City = NEI[NEI$fips == '24510',]

BC_Emissions_by_type_year = aggregate(emissions_in_Baltimore_City$'Emissions',by=list(emissions_in_Baltimore_City$'type',emissions_in_Baltimore_City$'year'),  FUN=sum)


plot3 = ggplot(BC_Emissions_by_type_year, aes(x=Group.2, y=x, color=Group.1))+geom_line()
plot3 = plot3 +labs(color='Type', x='Year', y='Emissions', title='Total emissions per year in Baltimore City')
plot3
dev.copy(png, file='./figure/plot3.png')
dev.off()
