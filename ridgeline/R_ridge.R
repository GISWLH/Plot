#install.packages("ggridges")
library(ggridges)
library(ggplot2)

# Sample data
df <- diamonds[1:100, c("color", "depth")]

ggplot(df, aes(x = depth, y = color)) +
  geom_density_ridges(fill = "lightblue", alpha = 0.5) 
  
ggplot(df, aes(x = depth, y = color, fill = color)) +
  geom_density_ridges()

ggplot(df, aes(x = depth, y = color, fill = stat(quantile))) +
  stat_density_ridges(quantile_lines = FALSE,
                      calc_ecdf = TRUE,
                      geom = "density_ridges_gradient") +
  scale_fill_brewer(name = "")