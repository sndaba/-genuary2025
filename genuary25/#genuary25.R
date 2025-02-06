# Load required library
library(ggplot2)

# Set seed for reproducibility
set.seed(123)

# Generate random points for the line
n_points <- 20
line_data <- data.frame(
  x = cumsum(runif(n_points, -1, 1)),  # Random x-coordinates with cumulative sum
  y = cumsum(runif(n_points, -1, 1))   # Random y-coordinates with cumulative sum
)

# Plot the line
ggplot(line_data, aes(x = x, y = y)) +
  geom_path(
    color = "steelblue", size = 2, lineend = "round"
  ) +  # Connect points with a smooth line
  geom_point(
    color = "orange", size = 4, shape = 21, fill = "yellow", stroke = 1.5
  ) +   # Highlight the points with a stylish design
  labs(
        x = NULL,
    y = NULL
  ) +
  theme_void() +  # Remove gridlines and axes
  theme(
    plot.background = element_rect(fill = "white", color = NA),
    plot.title = element_text(hjust = 0.5, size = 20, face = "bold", color = "darkblue"),
    plot.margin = margin(20, 20, 20, 20)
  )
