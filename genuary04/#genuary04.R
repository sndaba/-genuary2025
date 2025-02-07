library(ggplot2)

# Generate a range of shades of black using varying RGB values
shades_of_black <- rgb(seq(0.1, 0.9, length.out = 10), 
                       seq(0.1, 0.9, length.out = 10), 
                       seq(0.1, 0.9, length.out = 10))

# Set up the plot window with black background
par(bg = "black")

# Set the plot size
plot(1, 1, xlim = c(0, 1), ylim = c(0, 1), type = "n", xlab = "", ylab = "", axes = FALSE)

# Create an artistic pattern using shades of black
for (i in 1:10) {
  for (j in 1:10) {
    # Randomize positions slightly to create a more organic pattern
    x_pos <- runif(1, 0, 1)
    y_pos <- runif(1, 0, 1)
    
    # Draw rectangles using shades of black with random positioning
    rect(x_pos, y_pos, x_pos + 0.05, y_pos + 0.05, col = shades_of_black[i], border = NA)
  }
}

