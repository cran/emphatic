## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)
library(ggplot2)
library(emphatic)

## ----setup--------------------------------------------------------------------
library(ggplot2)
library(emphatic)

## -----------------------------------------------------------------------------
mtcars

## -----------------------------------------------------------------------------
mtcars |>
  hl('skyblue')

## -----------------------------------------------------------------------------
mtcars |>
  hl('skyblue', rows = cyl %in% c(6, 8))

## -----------------------------------------------------------------------------
mtcars |>
  hl(ggplot2::scale_colour_viridis_c(), rows = cyl %in% c(6, 8), cols = mpg)

## -----------------------------------------------------------------------------
mtcars |>
  hl(ggplot2::scale_colour_viridis_c(), rows = cyl %in% c(6, 8), cols = mpg, scale_apply = mpg:am)

## -----------------------------------------------------------------------------
mtcars |>
  hl(ggplot2::scale_colour_viridis_c(), rows = cyl %in% c(6, 8), 
     cols = mpg, scale_apply = mpg:am) |>
  hl('hotpink', rows = mpg == max(mpg))

## -----------------------------------------------------------------------------
mtcars |>
  hl(ggplot2::scale_colour_viridis_c(), rows = cyl %in% c(6, 8), 
     cols = mpg, scale_apply = mpg:am) |>
  hl('hotpink', rows = mpg == max(mpg)) |>
  hl_adjust(text_contrast = 0.25)

