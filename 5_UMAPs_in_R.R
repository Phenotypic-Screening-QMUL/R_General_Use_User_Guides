# Method 1
#Example UMAP
library(embed)

# Add your data and omit NAs
df <- data
df <-  na.omit(df)

# This is the UMAP Maths bit - note ~ means all variables. group_names is column identifying cell type 
umap_rec <- recipe(~., data = df)  %>%
  update_role(group_names, new_role = "id") %>%
  step_umap(all_predictors())

umap_prep <- prep(umap_rec)

umap_prep

library("ggplot2")

juice(umap_prep) %>%
  ggplot(aes(UMAP_1, UMAP_2, label = colnames)) +
  geom_point(aes(color = group_names ), size = 0.1, shape = 16) +
  #geom_text(check_overlap = TRUE, hjust = "inward", family = "arial") +
  labs(color = NULL, size= 5) + theme(legend.text=element_text(size=15)) +
  guides(color=guide_legend(override.aes=list(size=5))) + 
  theme (axis.text = element_text (size= 15), axis.title = element_text (size =15))

#Method 2 - Prefered
# Load required libraries
library("gplots")
library("RColorBrewer")
library("matrixStats")
library("plyr")
library("dplyr")
library("data.table")
library("stringr")
library("ggplot2")
library("tidyverse")
library("umap")

# Set theme
theme_set(theme_bw(18))


All_Data <- data # Add your data

# Remove rows with missing values and add an ID column
All_Data_New <- All_Data %>% 
  drop_na() %>%
  dplyr::mutate(ID = row_number())

# Create metadata dataframe
Meta <- All_Data_New 

### Make new Data Frames with the Treatment you want ####

Add_Data_New <- Add_Data_New %>% filter(treatment = "Y") #You might only want a UMAP of some compounds etc

# Set seed for reproducibility and perform UMAP dimensionality reduction
set.seed(142)
umap_fit <- All_Data_New  %>%
  select(where(is.numeric)) %>%
  column_to_rownames("ID") %>%
  umap()

# Extract UMAP coordinates and combine with metadata
umap_df <- umap_fit$layout %>%
  as.data.frame() %>%
  dplyr::rename(UMAP1 = "V1",
                UMAP2 = "V2") %>%
  dplyr::mutate(ID = row_number()) %>%
  inner_join(Meta, by = "ID")

# Define color vector
color_vector <- c("#D5D5D5", "#FF0000", "#000CFF")

# Plot UMAP with treatment labels
umap_df %>%
  ggplot(aes(UMAP1, UMAP2, label = treatment)) +
  geom_point(aes(color = treatment), size = 0.5, shape = 16) +
  labs(color = NULL, size = 15) + 
  theme(legend.text = element_text(size = 15)) +
  guides(color = guide_legend(override.aes = list(size = 15))) + 
  theme(axis.text = element_text(size = 10), axis.title = element_text(size = 10)) + 
  ylim(10, -10) + xlim(7.5, -7.5)

# Plot UMAP with 'Nuclei Area wv1' labels
umap_df %>% 
  ggplot(aes(UMAP1, UMAP2, label = `Nuclei Area wv1`)) +
  geom_point(aes(color = `Nuclei Area wv1`), size = 1, shape = 16) + 
  labs(color = NULL, size = 15) + 
  theme(legend.text = element_text(size = 15)) +
  guides(color = guide_legend(override.aes = list(size = 15))) + 
  theme(axis.text = element_text(size = 10), axis.title = element_text(size = 10)) + 
  ylim(10, -10) + xlim(10, -10) +
  scale_color_gradient2(low = "blue", mid = "white", high = "red", 
                        limits = c(-1, 1), oob = scales::squish)