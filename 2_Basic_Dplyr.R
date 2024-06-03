# Load the dplyr library
library(dplyr)

# 1. select():
# Select columns from a data frame.
# Example: select(data, col1, col2) selects columns col1 and col2 from the data frame data.
selected_data <- data %>% 
  select(col1, col2)

# 2. filter():
# Filter rows based on conditions.
# Example: filter(data, col1 > 5) filters rows where the value in col1 is greater than 5.
filtered_data <- data %>% 
  filter(col1 > 5)

# 3. mutate():
# Create new variables (columns) or modify existing ones.
# Example: mutate(data, new_col = col1 + col2) creates a new column new_col which is the sum of col1 and col2.
mutated_data <- data %>% 
  mutate(new_col = col1 + col2)

# 4. arrange():
# Arrange rows based on column values.
# Example: arrange(data, col1) arranges rows in ascending order of values in col1.
arranged_data <- data %>% 
  arrange(col1)

# 5. summarize():
# Summarize data, often by computing summary statistics like mean, median, etc.
# Example: summarize(data, mean_col = mean(col1)) computes the mean of col1.
summary_data <- data %>% 
  summarize(mean_col = mean(col1))

# 6. group_by():
# Group data by one or more variables.
# Example: group_by(data, col1) groups data by unique values in col1.
grouped_data <- data %>% 
  group_by(col1)

# 7. ungroup():
# Remove grouping structure.
# Example: ungroup(data) removes grouping from data.
ungrouped_data <- data %>% 
  ungroup()

# 8. distinct():
# Extract unique rows.
# Example: distinct(data, col1) returns unique rows based on values in col1.
distinct_data <- data %>% 
  distinct(col1)

# 9. inner_join():
# Combine two data frames by common keys, keeping only rows with matching keys.
# Example: inner_join(data1, data2, by = "key") joins data1 and data2 based on the common key column "key".
joined_data <- inner_join(data1, data2, by = "key")

# 10. left_join():
# Combine two data frames by common keys, keeping all rows from the left data frame.
# Example: left_join(data1, data2, by = "key") joins data1 and data2 based on the common key column "key", keeping all rows from data1.
left_joined_data <- left_join(data1, data2, by = "key")

# 11. right_join():
# Combine two data frames by common keys, keeping all rows from the right data frame.
# Example: right_join(data1, data2, by = "key") joins data1 and data2 based on the common key column "key", keeping all rows from data2.
right_joined_data <- right_join(data1, data2, by = "key")

# 12. full_join():
# Combine two data frames by common keys, keeping all rows from both data frames.
# Example: full_join(data1, data2, by = "key") joins data1 and data2 based on the common key column "key", keeping all rows from both data frames.
full_joined_data <- full_join(data1, data2, by = "key")