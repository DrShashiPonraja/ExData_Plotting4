source('getData.R')


emissions_in_Baltimore_City = NEI[NEI$fips == '24510',]

Baltimore_City_emissions_by_year = aggregate(emissions_in_Baltimore_City$'Emissions', by=list(Category=emissions_in_Baltimore_City$'year'), FUN=sum)
plot(Baltimore_City_emissions_by_year$Category, Baltimore_City_emissions_by_year$x, xlab="Year", ylab="Total Emissions", main = "Baltimore City Total Emissions by Year")
lines(Baltimore_City_emissions_by_year$Category, Baltimore_City_emissions_by_year$x)

dev.copy(png, file='./figure/plot2.png')
dev.off()
