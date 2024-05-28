## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)
library(dplyr)
library(ggplot2)
library(emphatic)

## -----------------------------------------------------------------------------
library(dplyr)
library(ggplot2)
library(emphatic)

challenger

## -----------------------------------------------------------------------------
challenger %>% 
  arrange(desc(temp))

## -----------------------------------------------------------------------------

challenger %>%
  arrange(desc(temp)) %>%
  hl(palette = scale_color_viridis_c(option = 'B'), cols = 'temp') %>%
  hl(
    scale_color_gradient(low = 'pink', high = 'red'),
    rows = damage > 0,
    cols = damage
  ) 

## -----------------------------------------------------------------------------
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Expand temperature range to include challenger launch temperature
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
challenger_expanded <- challenger %>%
  mutate(temp = factor(temp, levels = 30:81)) %>%
  tidyr::complete(temp) %>%
  arrange(desc(temp)) %>%
  as.data.frame() %>%
  mutate(temp = as.numeric(levels(temp))[temp]) %>%
  select(flight, everything()) %>%
  mutate(
    flight = if_else(temp == 31, "Challenger", flight)
  )


challenger_expanded %>% 
  hl(scale_color_viridis_c(option = 'B'), cols = temp, show_legend = TRUE) %>%
  hl(
    scale_color_gradient(low = 'lightblue', high = 'orange'),
    rows = !is.na(damage),
    cols = damage,
    show_legend = TRUE
  ) %>%
  hl('firebrick1', rows = temp == 31, cols = flight) %>%
  hl_adjust(na = '')

