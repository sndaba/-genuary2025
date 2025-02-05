library(ggplot2)

# Set up the plot area
plot(1, type = "n", xlab = "", ylab = "", xlim = c(0, 10), ylim = c(0, 10), axes = FALSE)

# Draw the sky (background)
rect(0, 0, 10, 10, col = "lightblue", border = NA)

# Draw the sun
points(8, 8, pch = 21, bg = "yellow", cex = 5, col = NA)

# Draw the ground
rect(0, 0, 10, 2, col = "darkgreen", border = NA)     # 0, 0, 10, 4

# Draw a tree trunk
rect(4, 2, 4.5, 4, col = "brown", border = NA)

# Draw the tree leaves
polygon(c(3, 4.25, 5.5), c(4, 7, 4), col = "darkgreen", border = NA)

# Draw a house
rect(6, 2, 8, 4, col = "red", border = NA)
rect(6.5, 2.5, 7.5, 4, col = "white", border = NA) # Door
polygon(c(6, 7, 8), c(4, 5, 4), col = "brown", border = NA) # Roof

# Draw a cloud
polygon(c(2, 3, 4, 5, 4, 3), c(8, 9, 9, 8, 7, 7), col = "white", border = NA)

# Add some grass
segments(x0 = runif(20, 0, 10), y0 = rep(0, 20), x1 = runif(20, 0, 10), y1 = runif(20, 0.5, 1.5), col = "green")


