
library(dplyr)

# Q1

x.a <- rnorm(1000, 1, 10)

# 1.1 Filter OUT extreme values out of two standard deviations
x.a <- x.a [x.a < (1 + 2 * 10) & x.a > (1 - 2 * 10)]

# 1.2 Plotting the distribution of the remaining vector x.a
plot(density(x.a), main = "PDF of rnorm(1000, 1, 10) within 2 sd")

# 1.3 Calculate the 25% 50% and 75% quantile of vector x.a. (You may google "quantile r)
quantile(x.a)

# 1.4 Get the sequence between 25% to 75% of x.a
x.a [x.a < quantile(x.a, 0.75) & x.a > quantile(x.a, 0.25)]

# Q2

x.b <- c("a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k")

# 2.1 Get only elements at odd positions
x.b [seq(from = 1, to = length(x.b), by = 2)]

# 2.2 Truncate the first 2 elements and the last 2 elements
x.b [3:(length(x.b) - 2)]


# Q3

population <- c(158228, 126687, 228075, 204903, 308383)
town <- c("中正", "大同", "中山", "松山", "大安")

# 3.1 Sort the population, 
# the reuslt should be [1] 126687 158228 204903 228075 308383
sort(population)

# 3.2 Sort populations in decreasing order 
# (Google it or check help)
# Result: [1] 308383 228075 204903 158228 126687
sort(population, decreasing = T)

# 3.3 Sort town names according to population in decreasing order
# Result: [1] "大安" "中山" "松山" "中正" "大同"
data.frame(town, population, stringsAsFactors = F) %>% 
  arrange(desc(population)) %>%
  select(town) %>%
  unlist() %>%
  unname()

# Q4

# 4.1 Print current time
# e.g., "2019-09-02 21:31:36 CST"
Sys.time()

# 4.2 Check the data type of current time
typeof(Sys.time())

# 4.3 Print today
# e.g., [1] "2019-09-02"
Sys.Date()

# 4.4 Check the data type of date
typeof(Sys.Date())

# 4.5 Write example to compare following functions: print(), cat(), and message() 

# print() prints out object in assistance with object counter like [1], and it also adds some type feature like "" for character.
# cat() concatenates different objects and gives a spacing between them, it concisely print out those objects themselves without other words or assistance like "" \n [1]
# cat() also drops attributes of its inputs. Thus it could be tricky when dealing with types like "factor" and "Date"
# message() gives a highlight for object to print, it's simply print out the object concisely in red color. 

print(Sys.Date())
cat(Sys.Date())
message(Sys.Date())
cat("Hello", "World")

# Q5

# 5.1 Using google to find out how to measure the ruuning time of the following code

start_time <- Sys.time()
x <- rnorm(10000000, 1, 10) 
plot(density(x))
end_time <- Sys.time()

end_time - start_time

# Q6

a <- c(5, 5, 5, 5, 4, 4, 4, 3, 3, 1, 1, 1, 2, 2, 2)
b <- c(3, 3, 3, 4, 4, 4, 2, 2, 2, 4, 4, 1, 4, 1, 1)
df2 <- data.frame(a, b)

# sort df2 in orders of decreasing b then increasing a
df2 <- df2[order(df2$a, -df2$b),]

# order(df2$a, df2$b) sort dataframe in orders of "a" first, then "b"
# the negative sign represent in orders of decreasing

# Q7

country <- c("CN", "US", "JP", "HK", "KR", "SG", "DE", "MY", "VN", "PH", "TH", "AU", "NL", "SA", "ID", "GB", "IN", "FR", "IT", "AE")

import <- c(26.142, 12.008, 7.032, 13.646, 4.589, 5.768, 2.131, 2.802, 3.428, 3.019, 1.976, 1.118, 1.624, 0.449, 0.983, 1.302, 1.027, 0.553, 0.670, 0.455)

export <- c(22.987, 12.204, 11.837, 7.739, 5.381, 4.610, 2.866, 2.784, 2.414, 2.092, 1.839, 1.788, 1.665, 1.409, 1.391, 1.075, 0.974, 0.899, 0.800, 0.728)

df <- data.frame(country, import, export)
df

df <- df %>%
  arrange(desc(export), desc(import))
df







