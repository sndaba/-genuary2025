# Load libraries
library(ggplot2)
library(gganimate)

# Create data for rectangles
rectangles <- data.frame(
  x = c(1, 2, 3, 1.5, 2.5),
  y = c(1, 2, 3, 1.5, 2.5),
  width = c(1, 0.8, 1.2, 1, 0.6),
  height = c(1.2, 1, 0.8, 1.5, 1),
  fill = c("black", "gray30", "gray70", "gray50", "gray90"),
  order = 1:5 # Order of appearance
)

# Create the plot
g <- ggplot() +
  geom_rect(
    data = rectangles,
    aes(
      xmin = x - width / 2, xmax = x + width / 2,
      ymin = y - height / 2, ymax = y + height / 2,
      fill = fill, group = order
    ),
    color = "white", size = 0.5
  ) +
  scale_fill_identity() +
  coord_fixed() +
  theme_void() +
  theme(
    panel.background = element_rect(fill = "gray20"),
    plot.background = element_rect(fill = "gray20", color = NA)
  ) +
  transition_states(
    order, 
    transition_length = 1, 
    state_length = 1
  ) +
  enter_fade() +
  exit_fade() +
  ease_aes('linear')

# Save the animation
animate(g, nframes = 100, fps = 10, width = 500, height = 500, renderer = gifski_renderer("brutalist_animation.gif"))
