# victoria-map

## Author

Andrew Stewardson (andrew-stewardson)

## Purpose

R script using ggmap to plot location of selected cefotaxime susceptible and resistant Salmonella isolates in Victoria from humans, cows and other sources. Three maps are produced: 
- Map 1 = single facet point plot
- Map 2 = as map 1 but with facet for each sample type (human, bovine, other)
- Map 3 = as map 2, with point size representing number of isolates

## Packages

- dplr
- ggmap

## Requirements

- Jason's data file (called 'coords') is saved in csv format in following path: 'data/base'
- Output path: 'output/figures'
