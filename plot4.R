source('getData.R')
library (ggplot2)

z = SCC[grep("[Cc][Oo][Aa][Ll]", SCC$Short.Name),]

Coal_Emissions = NEI[NEI$SCC %in% z$SCC,]

Coal_Emissions_by_year = aggregate(Coal_Emissions$Emissions, by=list(Coal_Emissions$year), FUN=sum)

ggplot(Coal_Emissions_by_year, aes(x=Group.1,y=x))+geom_line()+labs(x='Year', y="Total Coal Emissions", title = "Total US Coal-based emissions by year")

dev.copy(png, file='./figure/plot4.png')
dev.off()
