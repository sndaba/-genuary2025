# Load required library
install.packages("ggplot2")
library(ggplot2)

# Create a grid of points
n <- 300
data <- expand.grid(
  x = seq(-1, 1, length.out = n),
  y = seq(-1, 1, length.out = n)
)

# Generate a pattern using a mathematical formula
data$z <- (data$x^2 - data$y^2) * exp(-3 * (data$x^2 + data$y^2))

# Plot the art
g <- ggplot(data, aes(x, y, fill = z)) +
  geom_tile() +
  scale_fill_gradientn(colors = c("midnightblue", "cyan", "yellow", "red")) +
  coord_fixed() +
  theme_void() +
  theme(legend.position = "none")
g
