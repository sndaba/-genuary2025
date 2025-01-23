# Load the required library
install.packages("ggplot2")
library(ggplot2)

# Create a grid of points
n <- 500
data <- expand.grid(
  x = seq(0, 1, length.out = n),
  y = seq(0, 1, length.out = n)
)

# Add a gradient effect based on the combination of x and y coordinates
data$gradient <- data$x * data$y

# Create a creative slope gradient plot with a vibrant color palette
g <- ggplot(data, aes(x = x, y = y, fill = gradient)) +
  geom_raster() +
  scale_fill_gradientn(colors = c("purple", "blue", "cyan", "green", "yellow", "orange", "red")) +
  coord_fixed() +
  theme_void() +
  theme(legend.position = "none")
g
