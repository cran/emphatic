## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
library(emphatic)
sydney_rain |> head(15)

## -----------------------------------------------------------------------------
(mean_rain <- mean(unlist(sydney_rain[,-1]), na.rm = TRUE))

## -----------------------------------------------------------------------------
flood_years <- c(1970, 1971, 1984, 1986, 1990, 1996, 1998, 2007, 2012, 2013, 2015, 2016, 2020, 2021, 2022)

## -----------------------------------------------------------------------------
sydney_rain |>
  hl(
    ggplot2::scale_colour_gradient2(na.value = 'white', low = 'white', 
                                    high = 'darkgreen', midpoint = mean_rain), 
    cols = Jan:Dec
  ) |>
  hl('skyblue', rows = Year %in% flood_years, cols = 'Year') |>
  hl_adjust(na = '') |>
  as_svg(height = 1300)

