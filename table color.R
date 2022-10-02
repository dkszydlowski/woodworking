## working to see if I can differentiate lake colors based on mode or mean
# for the Yahara Chain
library(tidyverse)

wave = read.csv("Wavelengths.csv")

names(wave) = c("lake", "month", "wavelength")

wave = wave %>% mutate(wavlength = strsplit(wavlength, " ")[[1]][2])


strsplit(test, " ")[[1]][2]
