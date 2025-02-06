# Install and load packages
install.packages("imager")
install.packages("ggplot2")
install.packages("dplyr")

library(imager)
library(ggplot2)
library(dplyr)

# Load an image
image_path <- "view.jpg"  # Replace with your image path
img <- load.image(image_path)

# Convert image to a data frame
img_df <- as.data.frame(img, wide = "c") %>% 
  rename(red = c.1, green = c.2, blue = c.3) %>% 
  mutate(brightness = (red + green + blue) / 3)

# Sort pixels by brightness within each row
sorted_img_df <- img_df %>%
  group_by(y) %>%  # Sort within each row (y-coordinate)
  arrange(brightness) %>% 
  mutate(x = row_number()) %>%  # Reassign x-coordinates after sorting
  ungroup()

# Plot the sorted image
ggplot(sorted_img_df, aes(x = x, y = y, fill = rgb(red, green, blue))) +
  geom_tile() +
  scale_fill_identity() +  # Use the actual RGB values for fill color
  scale_y_reverse() +      # Reverse y-axis to match image orientation
  theme_void() +           # Remove axes and background
  coord_fixed()            # Maintain aspect ratio

# Save the plot
ggsave("pixel_sorted_plot.png", width = 10, height = 10, dpi = 300)
