suppressPackageStartupMessages(library(stars))
suppressPackageStartupMessages(library(dplyr))
tif = system.file("tif/L7_ETMs.tif", package = "stars")
(x = read_stars(tif))

(y <- x %>% select(L7_ETMs.tif))
(y <- x %>% filter(band > 2))
(z <- x %>% mutate(foo = 2* L7_ETMs.tif))
x %>% pull(L7_ETMs.tif) %>% head
x %>% filter(x > 289900)
x %>% slice("x", 50:100)

suppressPackageStartupMessages(library(ggplot2))
ggplot() + geom_stars(data = x) + coord_equal() + facet_wrap(~band)
ggplot() + geom_stars(data = x[,c(1:50,52:100),c(1:45, 50:60)]) +
	coord_equal()
ggplot() + geom_stars(data = x[,1:10,1:10,1:2], sf = TRUE) + facet_wrap(~band)
