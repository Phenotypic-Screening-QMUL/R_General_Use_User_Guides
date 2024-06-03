# Example t-SNE - Don't forget to scale!
library("Rtsne")
library("ggplot2")

# Replace NA values with 0 in the dataframe (if necessary)
df <- df %>% replace(is.na(.), 0)

# Perform t-SNE analysis
tsne_result <- Rtsne(df[,], perplexity = 100, check_duplicates = FALSE) # change perplexity as required

# Create dataframe for t-SNE plot
tsne_plot <- data.frame(x = tsne_result$Y[, 1], y = tsne_result$Y[, 2], col = df$Sample)

# Create t-SNE plot using ggplot2
tsne_plot_gg <- ggplot(tsne_plot) + 
  geom_point(aes(x = x, y = y, color = col), size = 0.1) +
  guides(color = guide_legend(override.aes = list(size = 5))) +
  theme(axis.text = element_text(size = 15), axis.title = element_text(size = 15), legend.text = element_text(size = 15)) +
  labs(x = "t-SNE 1", y = "t-SNE 2", color = "")

# Save the plot as an image file
ggsave("Sample_1_vs_Sample_2.png", plot = tsne_plot_gg)