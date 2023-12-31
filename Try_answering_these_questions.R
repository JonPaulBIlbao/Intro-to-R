# ============================
# MACHINE LEARNING IN FINANCE
# 
# University of Deusto DBS
# February, 2022
# ===========================


# Click on the file 'store_T_df.rds' in the files window on the right side
# A window will pop up asking this:
#
# "Load '/cloud/project/store_T_df.rds' into an R object named: store_df"
# 
# Say 'OK' and the dataset store_df will automatically loaded on your environment (right top)

# Look carefully at the summary (run the following code line)
# ==========

summary(store.df)

# Variables in the dataset:
#
# storeNum: 20 stores (numbered from 101 to 120)
# Year:     Two years (1 and 2)
# Week:     52 weeks per year (numbered 1 to 52)
# p1sales:  weekly sales of product 1 ($)
# p2sales:  weekly sales of product 2 ($)
# p1price:  product 1 price during the corresponding week
# p2price:  product 2 price during the corresponding week
# p1prom:   product 1 was promoted during the week (p1prom=1) or not (p1prom=0)
# p1prom:   product 2 was promoted during the week (p2prom=1) or not (p2prom=0)
# country:  Australia (AU), Brazil (BR), Canada (CN), Germnany (DE), Great Britain (GB),
#           Japan (JP), United States (US)
# 
# so each row corresponds to the weekly sales of product 1 and product 2 during two
# consecutive years in twenty different stores located in seven different countries


# Question 1: create a new dataset (dataframe) containing just the
#             following variables:
#                - p1sales
#                - p1price
#                - country
# ==========


# Question 2: Calculate the mean of p1sales and p2sales only for Germany (country="DE")
# ==========



# Question 3: Create a graphic with boxplots describing variable p1sales
#             by country
# ==========



# Question 4: Check if the mean of p1sales is significantly different when comparing both years
# ==========

