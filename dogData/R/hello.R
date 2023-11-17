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
dogData
#' Title
#'
#' @param data
#' @param breed
#'
#' @return
#' @export
#'
#' @examples

getBark<-function(data, breed){

  data |>
    dplyr::filter(Breed=={{breed}}) |>
    dplyr::select(Barking.Level)
}

getBark(data=dogData, breed = "French Bulldog")
library(sinew)
usethis::use_data(dogData)
sinew::makeOxygen(dogData)
