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
test_df <- head(mtcars, 10)

## -----------------------------------------------------------------------------
test_df |>
  hl('skyblue')

## -----------------------------------------------------------------------------
test_df |>
  hl(c('skyblue', 'hotpink', '#445566'))

## -----------------------------------------------------------------------------
test_df |>
  hl(ggplot2::scale_colour_viridis_c(), cols = disp)

## -----------------------------------------------------------------------------
test_df |>
  hl(ggplot2::scale_colour_viridis_c(), cols = disp, scale_apply = mpg:drat)

## -----------------------------------------------------------------------------
test_df |>
  hl(ggplot2::scale_colour_viridis_c(), cols = mpg, show_legend = TRUE) |>
  hl(ggplot2::scale_colour_viridis_c(), cols = disp, show_legend = TRUE)

## -----------------------------------------------------------------------------
test_df |>
  hl(ggplot2::scale_colour_viridis_c(), cols = c(wt, gear, carb), show_legend = TRUE) 

