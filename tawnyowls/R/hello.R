# Hello, world!
#
# This is an example function named 'hello'
# which prints 'Hello, world!'.
#
# You can learn more about package authoring with RStudio at:
#
#   http://r-pkgs.had.co.nz/
#
# Some useful keyboard shortcuts for package authoring:
#
#   Install Package:           'Ctrl + Shift + B'
#   Check Package:             'Ctrl + Shift + E'
#   Test Package:              'Ctrl + Shift + T'

hello <- function() {
  print("Hello, world!")

}
library(usethis)
library(devtools)

usethis::use_testthat()
usethis::use_test(name = "import")
use_test()

f <- read.csv("StrixM.csv")
g <- subset(f, material == "Feathers") # restrict analysis to feather samples

#' Title
#' @description
#' my_select selects values from a specified variable in a data frame
#'
#' @param data A data frame
#'
#' @param col A variable in the data frame
#' @param value The value of the variable you want to create a subset of.
#'
#' @return A subset of the data frame
#' @export
#'
#' @examples # Pass the data frame you want to create a subset of. The variable of interest and the value you want to select. Here we are creating a subset of data frame f gathering observations based from feather material. g <- my_select(f, f$material, "Feathers")
#'
my_select <- function(data, col, value){
subset(data, col == value)
}

g <- my_select(f, f$material, "Feathers")
View(g)
