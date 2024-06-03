library(ggplot2)

# Basic Syntax
ggplot(data = df, aes(x = X, y = Y, fill = Z)) +
  geom_XXX() +
  theme_XXX() +
  scale_XXX() +
  labs(title = "Title", x = "X-axis label", y = "Y-axis label") +
  guides(fill = guide_legend()) +
  facet_XXX()

# Common Geometries
# geom_point(): Scatter plot
# geom_bar(): Bar plot
# geom_line(): Line plot
# geom_boxplot(): Box plot
# geom_histogram(): Histogram
# geom_density(): Density plot
# geom_violin(): Violin plot
# geom_raster(): Raster plot

# Customizing Themes
theme_bw()                 # Black and white theme
theme_minimal()            # Minimalistic theme
theme(axis.text.x = element_text(angle = 45, hjust = 1)) # Rotate x-axis labels
theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank()) # Remove grid lines

# Customizing Scales
scale_fill_manual(values = c("#999999", "#E69F00"))  # Manual fill colors
scale_colour_manual(values = c("#999999", "#E69F00"))  # Manual line or point colors
scale_x_continuous(breaks = seq(0, 100, 10))          # Customize x-axis breaks
scale_y_continuous(labels = scales::percent_format()) # Customize y-axis labels

# Saving Plots
ggsave("plot.png", plot = last_plot(), width = 6, height = 4, dpi = 300)  # Save plot as PNG

# Example
ggplot(df, aes(x = X, y = Y, fill = Z)) + 
  geom_bar(stat = "summary", fun = "mean", alpha = 0.8) +
  geom_point(position = position_dodge(width = .9), color = "#EC7063") +
  theme_bw() +
  scale_fill_manual(values = c("#999999", "#E69F00")) +
  labs(title = "Title", x = "X-axis label", y = "Y-axis label") +
  guides(fill = guide_legend())

ggsave("plot.png", plot = last_plot(), width = 6, height = 4, dpi = 300)