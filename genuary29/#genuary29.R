# Load necessary libraries
library(ggplot2)
library(scales)

# Function to create grid-based points with color gradient
generate_grid_points <- function(n_rows, n_cols) {
  x <- rep(1:n_cols, each = n_rows)  # Repeat column indices
  y <- rep(1:n_rows, n_cols)         # Repeat row indices
  data.frame(x, y)
}

# Generate grid points
grid_data <- generate_grid_points(n_rows = 10, n_cols = 10)

# Plot the grid-based graphic design using ggplot2
ggplot(grid_data, aes(x = x, y = y)) +
  geom_tile(aes(fill = (x * y) %% 10), width = 1, height = 1) +  # Create a tile pattern with color fill
  scale_fill_gradientn(colors = c("yellow", "red", "blue", "green", "purple")) +  # Gradient color palette
  coord_fixed() +
  theme_void() +
  theme(
    plot.margin = margin(0, 0, 0, 0),
    panel.border = element_blank(),  # Remove the boundary
    legend.position = "none"         # Remove the legend
  ) 
