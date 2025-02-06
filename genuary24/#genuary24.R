# Load necessary libraries
library(ggplot2)
library(dplyr)
library(tidyr)
library(RColorBrewer)

# Set seed for reproducibility
set.seed(123)

# Generate data for triangles
triangles <- data.frame(
  x1 = runif(10, 0, 15), # x-coordinate of the first vertex
  y1 = runif(10, 10, 15), # y-coordinate of the first vertex
  x2 = runif(10, 0, 15), # x-coordinate of the second vertex
  y2 = runif(10, 0, 15), # y-coordinate of the second vertex
  x3 = runif(10, 0, 15), # x-coordinate of the third vertex
  y3 = runif(10, 0, 15), # y-coordinate of the third vertex
  fill = sample(brewer.pal(9, "Set3"), 10, replace = TRUE) # Bright color palette
)

# Reshape data for plotting
triangles_long <- triangles %>%
  mutate(id = row_number()) %>%
  pivot_longer(cols = starts_with("x"), names_to = "vertex_x", values_to = "x") %>%
  mutate(y = case_when(
    vertex_x == "x1" ~ y1,
    vertex_x == "x2" ~ y2,
    vertex_x == "x3" ~ y3
  ))

# Create the geometric art plot with smaller triangles and a colorful background
p <- ggplot(triangles_long, aes(x = x, y = y, group = id, fill = fill)) +
  geom_polygon(color = "white", size = 0.2) + # Slightly thicker border for clarity
  scale_fill_identity() +
  coord_fixed() +
  theme_void() +
  theme(
    panel.background = element_rect(fill = "lightyellow", color = NA),
    plot.background = element_rect(fill = "lightyellow", color = NA)
  )

# Display the plot
print(p)

