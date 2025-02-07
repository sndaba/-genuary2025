# Load necessary library
library(grid)

# Set up the plot area
grid.newpage()
pushViewport(viewport(xscale = c(0, 10), yscale = c(0, 10)))

# Define a function to draw vertical and horizontal lines
draw_windowpane <- function(line_spacing, line_width, line_color) {
  # Draw vertical lines
  for (i in seq(0, 10, by = line_spacing)) {
    grid.lines(x = unit(c(i, i), "native"), y = unit(c(0, 10), "native"), 
               gp = gpar(col = line_color, lwd = line_width))
  }
  # Draw horizontal lines
  for (j in seq(0, 10, by = line_spacing)) {
    grid.lines(x = unit(c(0, 10), "native"), y = unit(c(j, j), "native"), 
               gp = gpar(col = line_color, lwd = line_width))
  }
}

# Define pattern parameters
line_spacing <- 2  # Spacing between lines
line_width <- 2    # Width of the lines
line_color <- "#1F78B4"  # Color of the lines (blue)

# Draw the windowpane pattern
draw_windowpane(line_spacing, line_width, line_color)

# Add a title (optional)
grid.text("Windowpane Pattern", x = 0.5, y = 9.5, 
          just = "center", gp = gpar(fontsize = 16, col = "black"))
