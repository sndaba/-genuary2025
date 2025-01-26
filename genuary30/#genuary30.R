# Load necessary libraries
library(ggplot2)
library(viridis)

# Function to generate abstract geometric patterns (rectangles, triangles, etc.)
generate_geometric_shapes <- function(n_shapes) {
  shapes <- lapply(1:n_shapes, function(i) {
    shape_type <- sample(c("rectangle", "triangle"), 1)  # Randomly choose shape type
    x_center <- runif(1, min = -10, max = 10)
    y_center <- runif(1, min = -10, max = 10)
    
    if (shape_type == "rectangle") {
      width <- runif(1, min = 1, max = 6)  # Increased range for more variation
      height <- runif(1, min = 1, max = 6)
      x <- c(x_center - width / 2, x_center + width / 2, x_center + width / 2, x_center - width / 2)
      y <- c(y_center - height / 2, y_center - height / 2, y_center + height / 2, y_center + height / 2)
    } else {
      size <- runif(1, min = 2, max = 6)  # Increased range for more variation
      x <- c(x_center, x_center + size, x_center - size)
      y <- c(y_center + size, y_center - size, y_center - size)
    }
    
    data.frame(x = x, y = y, group = i, shape = shape_type)
  })
  
  do.call(rbind, shapes)
}

# Generate a moderate number of abstract geometric shapes
shape_data <- generate_geometric_shapes(n_shapes = 20)  # Reduced number of shapes

# Create a brighter color for each shape using a brighter viridis palette
shape_data$color <- viridis::viridis(n = nrow(shape_data), option = "C")

# Plot the abstract map art using ggplot2
ggplot(shape_data, aes(x = x, y = y, group = group)) +
  geom_polygon(aes(fill = color, color = color), size = 1.5, alpha = 0.7) +  # Draw geometric shapes with unique colors
  scale_fill_identity() +  # Use the assigned colors directly
  scale_color_identity() + # Use the assigned colors directly
  coord_fixed() +
  theme_void() +
  theme(
    plot.margin = margin(0, 0, 0, 0),
    panel.border = element_blank(),  # Remove the boundary
    legend.position = "none"         # Remove the legend
  )
