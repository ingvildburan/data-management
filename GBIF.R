options(gbif_user = "ingvildbk")
options(gbif_email = "ingvild.b.kroglund@nord.no")
options(gbif_pwd = "Doktorgrad23")

## Custom install & load function
install.load.package <- function(x) {
  if (!require(x, character.only = TRUE)) {
    install.packages(x, repos = "http://cran.us.r-project.org")
  }
  require(x, character.only = TRUE)
}
## names of packages we want installed (if not installed yet) and loaded
package_vec <- c(
  "rgbif",
  "knitr", # for rmarkdown table visualisations
  "rnaturalearth", # for shapefile access
  "wicket" # for transforming polygons into wkt format; may have to run: remotes::install_version("wicket", "0.4.0")
)
## executing install & load for each package
sapply(package_vec, install.load.package)

##         rgbif         knitr rnaturalearth        wicket
##          TRUE          TRUE          TRUE          TRUE

sp_name <- "Calluna vulgaris"
sp_backbone <- name_backbone(name = sp_name)
knitr::kable(sp_backbone)

sp_key <- sp_backbone$usageKey
sp_key


## [1] 2882482
sp_backbone <- name_backbone(name = sp_name, verbose = TRUE)
knitr::kable(t(sp_backbone))

knitr::kable(name_backbone("Calluna vul", verbose = TRUE))
knitr::kable(name_backbone("Glocianus punctiger", verbose = TRUE))

checklist_df <- name_backbone_checklist(c(sp_name, "Glocianus punctiger"))
knitr::kable(checklist_df)

sp_suggest <- name_suggest(sp_name)$data
knitr::kable(t(head(sp_suggest)))

sp_lookup <- name_lookup(sp_name)$data
knitr::kable(head(sp_lookup))
View(head(sp_lookup))

sp_usage <- name_usage(key = sp_key, data = "vernacularNames")$data
knitr::kable(head(sp_usage))
#####
sp_name <- "Calluna vulgaris"
sp_backbone <- name_backbone(name = sp_name)
sp_key <- sp_backbone$usageKey

occ_count(taxonKey = sp_key)
## [1] 882471
occ_search(taxonKey = sp_key, limit = 0)$meta$count
## [1] 882471

occ_NO <- occ_search(taxonKey = sp_key, country = "NO")
occ_NO$meta$count

NO_shp <- rnaturalearth::ne_countries(country = "Norway", scale = 110, returnclass = "sf")

shape_leaflet <- leaflet(NO_shp) %>% # will not work until we have rtools installed
  addTiles() %>%
  addPolygons(col = "red")
saveWidget(shape_leaflet, "leaflet_shape.html", selfcontained = TRUE)

NO_wkt <- st_as_text(st_geometry(NO_shp))
occ_wkt <- occ_search(taxonKey = sp_key, geometry = NO_wkt)
occ_wkt$meta$count
## [1] 29070

occ_year <- occ_search(
  taxonKey = sp_key,
  country = "NO",
  year = 2022
)
occ_year$meta$count
## [1] 2545

occ_window <- occ_search(
  taxonKey = sp_key,
  country = "NO",
  year = 2000:2022
)

sum(unlist(lapply(occ_window, FUN = function(x) {
  x$meta$count
})))
## [1] 24748
occ_count(
  taxonKey = sp_key,
  country = "NO",
  year = "2000,2022"
)
## [1] 24748
