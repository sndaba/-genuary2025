library(ggplot2)

# Set up the plot area
set.seed(123)  # For reproducibility
par(mar = c(0, 0, 0, 0), bg = "black")  # Remove margins and set background to black
plot(1, type = "n", xlim = c(0, 100), ylim = c(0, 100), axes = FALSE, xlab = "", ylab = "")

# Create a gradient background
for (i in 1:100) {
  rect(0, i, 100, i + 1, col = rgb(0, 0.1, 0.2, alpha = runif(1, 0.1, 0.3)), border = NA)
}

# Add glowing orbs
n_orbs <- 50
orb_colors <- hcl(h = runif(n_orbs, 0, 360), c = 100, l = 70, alpha = runif(n_orbs, 0.3, 0.8))
for (i in 1:n_orbs) {
  x <- runif(1, 10, 90)
  y <- runif(1, 10, 90)
  r <- runif(1, 3, 10)
  symbols(x, y, circles = r, inches = FALSE, add = TRUE, fg = NA, bg = orb_colors[i])
}

# Add swirling lines
n_lines <- 20
for (i in 1:n_lines) {
  x <- runif(1, 0, 100)
  y <- runif(1, 0, 100)
  curve_col <- hcl(h = runif(1, 0, 360), c = 100, l = 70, alpha = runif(1, 0.2, 0.6))
  curve(sin(x / 10) * 10 + y, from = x, to = x + runif(1, 20, 50), n = 1000, 
        col = curve_col, lwd = runif(1, 0.5, 2), add = TRUE)
}

# Add sparkling dots
n_dots <- 500
dot_colors <- hcl(h = runif(n_dots, 0, 360), c = 100, l = 70, alpha = runif(n_dots, 0.3, 0.8))
points(runif(n_dots, 0, 100), runif(n_dots, 0, 100), pch = 19, col = dot_colors, cex = runif(n_dots, 0.1, 0.5))


