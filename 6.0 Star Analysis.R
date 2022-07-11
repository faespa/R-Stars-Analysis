library(tidyverse)
library(dslabs)
data(stars)
options(digits = 3)   # report 3 significant digits

head(stars)
p <-  c(mean(stars$magnitude), sd(stars$magnitude))

p <- stars %>% 
  ggplot(aes(magnitude)) +
  geom_density()
 

p <- stars %>% 
  ggplot() +
  geom_density(aes(temp))


min(stars$temp)

#scatter PLot Temperature vs magnitude
p <- stars %>%
  ggplot(aes(temp, magnitude)) +
  geom_point() 
  
#change scale and flip axes  add geom text
p <- stars %>%
  ggplot(aes(log10(temp), magnitude)) +
  geom_point() +
  geom_text(aes(label = star)) +
  scale_y_reverse() +
  scale_x_reverse()


#add class and order for color
ManCol = c("#000000", "#0000FF", "#00FF00", 
           "#00FFFF", "#FF0000", "#FF00FF", 
           "#FFFF00", "#AAAAAA", "#0F0F0F",
           "#F0F0F0")

p <- stars %>%
  ggplot(aes(log10(temp), magnitude)) +
  geom_point(aes(col = type)) +
  geom_text(aes(label = star, col = type), nudge_x = 0.075) +
  scale_y_reverse() +
  scale_x_reverse()

#remove labels and add manual color values for color
p <- stars %>%
  ggplot(aes(log10(temp), magnitude)) +
  geom_point(aes(col = type)) +
  scale_y_reverse() +
  scale_x_reverse() +
  scale_colour_manual(values = ManCol)
p
head(stars)