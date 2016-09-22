# PURPOSE: Maps of isolates in Victoria

### SET-UP ----------------------------------------------------------------------

# Require packages

require(dplyr)
require(ggmap)

# Import data

df <- read.csv('data/base/coords.csv')

### GET MAP ---------------------------------------------------------------------

# This map uses coordinates to selecte relevant part of Victoria
map <- get_map(location = c(141,-39.2,148,-35), maptype='toner-lite', zoom=7)

# ! Other maps options ! #
#map <- get_map(location = 'Victoria, Australia', source='osm', color='bw', zoom=6)
#map <- get_map(location = c(141,-39,148,-35), source='osm', color='bw', zoom=6)
#map <- get_map(location = 'Victoria, Australia', maptype='toner', zoom=7)
#map <- get_map(location = 'Victoria, Australia', maptype = 'road',zoom= 6)


### MAPS --------------------------------------------------------

## Map 1: Point map - one facet

# Plot map
ggmap(map) + 
  geom_jitter(data = df, aes(x = Long, y= Lat, colour=cefotaxime, shape=card_type), 
             alpha=0.8,
             size=3) +
  theme_nothing()       # removes all plot elements

# Save map
ggsave("output/figures/map1.pdf")


## Map 2: Point map - three facets

# Plot map
ggmap(map) + 
  geom_jitter(data = df, aes(x = Long, y= Lat, colour=cefotaxime), 
              alpha=0.8,
              size=3) +
  facet_wrap(~ card_type, nrow = 1) +
  theme(legend.position = 'none',       # no legend
        axis.text=element_blank(),      # no tick text
        axis.ticks=element_blank(),     # no ticks
        axis.title=element_blank())     # no axis titles

# Save map
ggsave("output/figures/map2.pdf")


## Map 3: Bubble plot - three facets

# Summarise data to have number of strains of each source, per postcode
temp <- df %>%
  group_by(card_type, Lat, Long, cefotaxime) %>%
  summarise(count=n())

# Plot map
ggmap(map) + 
  geom_jitter(data = temp, aes(x = Long, y= Lat, colour=cefotaxime, size=count), 
              alpha=0.6) +
  facet_wrap(~ card_type, nrow = 1) +
  theme(legend.position = 'none',
        axis.text=element_blank(),
        axis.ticks=element_blank(),
        axis.title=element_blank())

# Save map
ggsave("output/figures/map3.pdf")
