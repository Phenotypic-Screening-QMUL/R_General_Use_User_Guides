# Useful Packages
library("gplots")       # Graphical plots
library("RColorBrewer") # Color palettes
library("matrixStats")  # Efficient matrix computations
library("plyr")        # Data manipulation
library("dplyr")       # Data manipulation
library("data.table")  # High-performance data manipulation
library("stringr")     # String manipulation
library("ggplot2")     # Elegant plots
library("Rtsne")       # Dimensionality reduction
library("readxl")      # Read Excel files


#Importing and Exporting

# Import CSV File
data_fread <- fread("TEST.csv") # Fast CSV reading using fread function from data.table package
data_readcsv <- read.csv("Test.csv") # CSV reading using read.csv function from base R

# Import Excel File
data_excel <- read_excel("file.xlsx") # Excel file reading using read_excel function from readxl package

# Save CSV
write.csv(Test, "Test.csv") # Save the Test data frame to a CSV file using write.csv function from base R
write_xlsx(Test, "Test.xlsx") # Save the Test data frame to an Excel file using write_xlsx function from readxl package

#Basic R Functions
data_frame_1$col1 #select col1 from data_frame_1

data_frame_1[c(1:5),] # select rows 1:5 from data_frame_1

data_frame_1[,c(1:5)] # select columns 1:5 from data_frame_1

mean_col1 <- mean(DF$col1) # Calculate the mean of col1

median_col1 <- median(DF$col1) # Calculate the median of col1

sd_col1 <- sd(DF$col1) # Calculate the standard deviation of col1

var_col1 <- var(DF$col1) # Calculate the minimum value of col1

min_col1 <- min(DF$col1) # Calculate the minimum value of col1

max_col1 <- max(DF$col1) # Calculate the maximum value of col1

range_col1 <- range(DF$col1) # Calculate the range of col1

percentile_75 <- quantile(DF$col1, 0.95) # Calculate the 95th percentile of col1

colnames(data_frame) # get all variables names 

rownames(data_frame) # get all rows names 

colnames(data_frame_1) <- colnames(data_frame_2) #make data_frame_1 have same colnames as data_frame_2

#Dplyr
result_data_frame <- data_frame %>%
  summarize(mean_col1 = mean(col1, na.rm = TRUE)) # Calculate the mean of col1

summarize_at(vars(col1, col2), funs(mean = mean)) # Summarize specific columns (vars)  

filter(col1 == "x")          # Filter based on column col1 (x can be string / numeric /factor)

filter(col1 %in% Y)        # Filter rows where column col1 values are present in vector Y

filter(col1 %in% c("x", "y"))        # Filter rows where column col1 values are present in vector c("x", "y")

mutate(col1 = "x")           # Create or modify column - col1 becomes column name

mutate_at(vars(col1, col2), as.numeric) # Convert columns to numeric

relocate(col1, .after = col2) # Move column col1 to be after column col2

group_by(Dose)            # Group data

na.omit() # remove rows with NA values

replace_na(list(col1 = 0)) # Replace NA values with 0 using dplyr's replace_na() function

mutate_at(c(col1, col2), funs(c(scale(.))))           # Scale columns col1 and col2
mutate_at(c(1:26), funs(c(scale(.))))          # Scale columns based on index

mutate(
  New_Col = case_when(
    col2 == "1" ~ 3,  # If col2 equals "1", then New_Col will be 3
    col2 == "2" ~ 4,  # If col2 equals "2", then New_Col will be 4
    TRUE ~ col2   # For all other values of col2, New_Col will keep the value from the col2 column
  )
)  # Create New_Col based on conditions in col2    


filter(((str_detect(Well, row)))) # Filter rows using String Detect


mutate(col1 = str_remove(col2, "z"))     # Remove pattern with String Remove

# Top Numbers
Top_20 <- top_n(df, 20, variable) # Select top rows