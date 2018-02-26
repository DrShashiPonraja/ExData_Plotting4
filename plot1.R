source('getData.R')



total_emissions_by_year = aggregate(NEI$'Emissions', by=list(Category=NEI$'year'), FUN=sum)

par(mfrow=c(1,1))
plot(total_emissions_by_year$Category, total_emissions_by_year$x, xlab="Year", ylab="Total Emissions", main = "Total Emissions by Year")
lines(total_emissions_by_year$Category, total_emissions_by_year$x)

dev.copy(png, file='./figure/plot1.png')
dev.off()
