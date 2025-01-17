% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/mapppd_searchr.R
\name{mapppd_searchr}
\alias{mapppd_searchr}
\title{Spatial query for MAPPPD}
\usage{
mapppd_searchr(Latitude = NULL, Longitude = NULL, distance = NULL)
}
\arguments{
\item{Latitude}{Latitude in decimal degrees (WGS 1984)}

\item{Longitude}{Longitude in decimal degrees (WGS 1984)}

\item{distance}{Decimal distance in kilometers}
}
\description{
Accesses and searches through the sites_sf shape using a point and a buffer size
}
\examples{
library(mapppdr)
land_mask <- sf::st_as_sf(CCAMLRGIS::load_Coastline()) \%>\%
  dplyr::select(layer) \%>\%
  dplyr::filter(layer == "coastline") \%>\%
  sf::st_transform(4326)

Latitude <- -60.7612
Longitude <- -44.637
Buffer <- 5

searched <- mapppdr::mapppd_searchr(Latitude,Longitude,Buffer)

land_mask_crop <- sf::st_crop(land_mask,sf::st_bbox(searched))
extentdat <- sf::st_bbox(tsearched)

ggplot() +
  geom_sf(data=land_mask)+
  geom_sf(data=searched)+
  coord_sf(xlim = c(extentdat[1]-0.25, extentdat[3]+0.25), 
           ylim = c(extentdat[2]-0.25, extentdat[4]+0.25), expand = FALSE)
           
}
