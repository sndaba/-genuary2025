# Load required libraries
library(ggplot2)
library(gganimate)

# Create a data frame for the pattern
n <- 200  # Number of points
repeats <- 10  # Number of repeated patterns
df <- data.frame(
  x = rep(seq(0, 10, length.out = n), times = repeats),
  y = rep(1:repeats, each = n) + sin(rep(seq(0, 10, length.out = n), times = repeats) * pi),
  group = rep(1:repeats, each = n)
)

# Define the plot
p <- ggplot(df, aes(x = x, y = y, group = group, color = as.factor(group))) +
  geom_line(size = 1) +
  scale_color_manual(values = colorRampPalette(c("blue", "purple", "cyan", "pink", "orange"))(repeats)) +
  theme_minimal() +
  theme(
    legend.position = "none",
    panel.background = element_rect(fill = "black"),
    plot.background = element_rect(fill = "black"),
    panel.grid = element_blank()
  ) +
  labs(title = "Infinite Scroll Illusion", x = NULL, y = NULL) +
  transition_reveal(x) +
  ease_aes('linear')

# Animate the plot
animate(p, nframes = 200, fps = 20, duration = 10, rewind = TRUE, width = 800, height = 400, renderer = gifski_renderer())

# Save the animation
anim_save("infinite_scroll_art.gif")
