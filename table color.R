## working to see if I can differentiate lake colors based on mode or mean
# for the Yahara Chain
library(tidyverse)
library(modeest)

wave = read.csv("wavelengths_v2.csv")

names(wave) = c("lake", "month", "wavelength")

wave = wave %>% mutate(wavelength = sub(".* ", "", wavelength)   )

wave$wavelength = as.numeric(wave$wavelength)

hist(wave$wavelength)
plot(density(wave$wavelength))

mendota = wave %>% filter(lake == "ME")
kegonsa = wave %>% filter(lake == "KE")
monona = wave %>% filter(lake == "MO")
wingra = wave %>% filter(lake == "WI")

boxplot(wavelength~ month, data = mendota)
boxplot(wavelength~ month, data = kegonsa)
boxplot(wavelength~ month, data = monona)
boxplot(wavelength~month, data = wingra)


plot(density(mendota$wavelength))
plot(density(kegonsa$wavelength))

meMode = mlv(mendota$wavelength, method = "meanshift")
moMode = mlv(monona$wavelength, method = "meanshift")
keMode = mlv(kegonsa$wavelength, method = "meanshift")
wiMode = mlv(wingra$wavelength, method = "meanshift")

test = mlv(waveMean$`mean(wavelength)`, method = "meanshift")

plot(density(waveMean$`mean(wavelength)`))

# estimate the mode from the density distribution
### Could it be that the months will more datapoints are biasing the estimates towards green?

# Need to have the mode, not the average!

waveMean = mendota %>% group_by(month) %>%  summarize(mean(wavelength))



# work to calculate the mode of the modes so that each months is weighted equally


wiMonthModes = wingra %>% 
  filter(month > 1) %>% 
  group_by(month)  %>% 
  summarize(modeWave = mlv(wavelength, method = "meanshift"))
 
wiMonthModes[12, ] = list(1, 513.51)   


wiMonMode = mlv(wiMonthModes$modeWave, method = "meanshift")
mlv(wingra$wavelength, method = "meanshift")
wiMonMode

sapply(wingra$wavelength, FUN = "mean")
                                        