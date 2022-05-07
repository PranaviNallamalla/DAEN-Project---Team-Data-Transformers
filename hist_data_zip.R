#library(revgeo)
library(sp)
library(rgdal)

#import zips shapefile and transform CRS 
zips <- readOGR("C:/Users/hjutr/downloads/tl_2021_us_zcta520/tl_2021_us_zcta520.shp")
zips <- spTransform(zips, CRS("+proj=longlat +datum=WGS84 +ellps=WGS84 +towgs84=0,0,0"))

#here is a sample with three cities in New York State and their coordinates      
data <- read.csv("C:/Users/hjutr/downloads/file.csv")

#extract only the lon/lat                   
xy <- data[,c(2,1)]

#transform coordinates into a SpatialPointsDataFrame
spdf <- SpatialPointsDataFrame(coords = xy, data = data, proj4string = CRS("+proj=longlat +datum=WGS84 +ellps=WGS84 +towgs84=0,0,0"))

#subset only the zipcodes in which points are found
zips_subset <- zips[spdf, ]

#NOTE: the column in zips_subset containing zipcodes is ZCTA5CE10
#use over() to overlay points in polygons and then add that to the original dataframe

data$zip <- over(spdf, zips_subset[,"ZCTA5CE20"])

#write.csv(data, "historical_data.csv")

# Install development version of data.table
install.packages("data.table", 
                 repos = "https://Rdatatable.github.io/data.table", type = "source")

library(data.table)

# Write CSV
fwrite(z, "historical_data_zips.csv")

z <- data$zip
df <- data[,0:15]
data1 <- merge(df,z)
