# Load necessary library
library(ggplot2)

# Set seed for reproducibility
set.seed(123)

# Generate data for vertical and horizontal lines
lines_data <- data.frame(
  orientation = sample(c("vertical", "horizontal"), 100, replace = TRUE),
  position = runif(100, 0, 10),
  color = sample(colors(), 100, replace = TRUE)
)

# Create a plot with only vertical and horizontal lines
p <- ggplot() +
  # Add vertical lines
  geom_vline(data = subset(lines_data, orientation == "vertical"), 
             aes(xintercept = position, color = color), size = 3) +
  # Add horizontal lines
  geom_hline(data = subset(lines_data, orientation == "horizontal"), 
             aes(yintercept = position, color = color), size = 3) +
  scale_color_identity() +
  theme_void() +
  theme(
    panel.background = element_rect(fill = "white", color = NA),
    plot.background = element_rect(fill = "white", color = NA)
  )

# Display the plot
print(p)
