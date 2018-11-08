##Script to access SQLite tables from R

#load RSQLite package
# install from CRAN 
# documentation here: https://cran.r-project.org/web/packages/RSQLite/index.html 
library(RSQLite)

#define the SQLite driver
driver <- dbDriver('SQLite')

#connect to the SQLite database (update path to your database)
con <- dbConnect(driver, '/home/daniel/GIS/Merged_field_inventory_data.db')

#list tables 
dbListTables(con)

#select all 74620 trees
trees <- dbGetQuery(con, "SELECT * FROM trees")

#select only DBH:HEIGHT measured trees
dbh_height_trees <- dbGetQuery(con, "SELECT * FROM trees WHERE HEIGHT > 0")
