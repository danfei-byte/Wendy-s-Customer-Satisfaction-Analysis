setwd("/Volumes/PortableSSD/Programming/R/Statistical Programming")
getwd()
# Import data
data <- read.csv("data_wendys.csv") 
str(data)

# 1. Data cleaning (remove missing rating values)
data.clean <- data[which(!is.na(data$rating_wendys) & 
                         !is.na(data$rating_mcd) & 
                         !is.na(data$rating_subway) & 
                         !is.na(data$rating_burgerking)), ]
str(data.clean)
View(data.clean)

# 2. Comparative analysis of customer ratings
## Descriptive statistics
install.packages("knitr")
install.packages("kableExtra")
library(dplyr)
library(tidyr)

stats_table <- data.clean %>%
  summarise(
    Mean_Wendys = mean(rating_wendys),
    Median_Wendys = median(rating_wendys),
    SD_Wendys = sd(rating_wendys),
    IQR_Wendys = IQR(rating_wendys),
    
    Mean_McDonalds = mean(rating_mcd),
    Median_McDonalds = median(rating_mcd),
    SD_McDonalds = sd(rating_mcd),
    IQR_McDonalds = IQR(rating_mcd),
    
    Mean_BurgerKing = mean(rating_burgerking),
    Median_BurgerKing = median(rating_burgerking),
    SD_BurgerKing = sd(rating_burgerking),
    IQR_BurgerKing = IQR(rating_burgerking),
    
    Mean_Subway = mean(rating_subway),
    Median_Subway = median(rating_subway),
    SD_Subway = sd(rating_subway),
    IQR_Subway = IQR(rating_subway)
  ) %>%
  pivot_longer(everything(), names_to = c("Metric", "Brand"), names_sep = "_") %>%
  pivot_wider(names_from = "Brand", values_from = "value") %>%
  mutate(across(where(is.numeric), ~ round(., 2)))
print(stats_table)

library(knitr)
library(kableExtra)
kable(stats_table, format = "html", caption = "Descriptive Statistics for Customer Ratings") %>%
  kable_styling(full_width = FALSE, bootstrap_options = c("striped", "hover")) # Generate a styled table

### Create boxplot visuals
png("Customer_Ratings_Distribution.png", width = 800, height = 600) # Open a PNG graphics device

boxplot(data.clean$rating_wendys, data.clean$rating_mcd, data.clean$rating_burgerking, data.clean$rating_subway,
        names = c("Wendy's", "McDonald's", "Burger King", "Subway"), 
        main = "Customer Ratings Distribution by Brand", 
        xlab = "Brand", 
        ylab = "Rating", 
        col = c("lightblue", "pink", "lightgreen", "yellow"))

dev.off() # Close the graphics device
#### **Key findings:**
#### 1) Consistency in scores: Wendy's has a SD of 1.73, indicating relatively consistent 
#### scores compared to McDonald's(2.03) and Burger King(1.86); Subway has the lowest SD(1.72),
#### suggesting that Wendy's is fairly consistent while slightly less than Subway.
#### 2) Mean score: Wendy's performs well overall in customer satification with a mean score of 7.58,
#### trailing only Subway with a mean score of 7.84.
#### 3) Median score: the typical middle score of Wendy's is at the top level among its competitors,
#### with a median score of 8 which is higher than McDonald's and Burger King, and on par with Subway.
#### 4) from the boxplot, Wendy's and Subway both have smaller IQRs compared to McDonald's and Burger King
#### further supporting the consistent customer experience delivered by those two brands.

# 3. Correlation and brand positioning
## generate correlation matrix
rating_com <- data.frame(
    Wendys = data.clean$rating_wendys,
    McDonalds = data.clean$rating_mcd,
    BurgerKing = data.clean$rating_burgerking,
    Subway = data.clean$rating_subway
)
matrix <- cor(rating_com) 
matrix <- round(matrix, 2)
matrix # soluton 1
kable(matrix, format = "html", caption = "Correlation Among Brands") %>%
  kable_styling(full_width = FALSE, bootstrap_options = c("striped", "hover")) # Generate a styled table

cor(data.clean[, c("rating_wendys", "rating_mcd", 
                  "rating_burgerking", "rating_subway")]) # solution 2

## visualize the correlation
install.packages("corrplot")
library(corrplot)
png("Correlation_Brand_Positioning.png", width = 800, height = 600)

corrplot(matrix, 
         method = "circle",        # Display numbers instead of colors/shapes
         type = "upper",           # Show only the upper triangle
         tl.cex = 0.8,             # Adjust text label size
         number.cex = 0.8,         # Adjust number size
         col = colorRampPalette(c("blue", "white", "red"))(200)) # Use a color gradient

dev.off()
## correltaion hypothesis test
cor.test(data.clean$rating_wendys, data.clean$rating_burgerking)
### **Key findings:**
#### 1) all correlation coefficients are below 0.5, suggesting that customer ratings for these four
#### brands do not strongly move together. This further implies that customer perceptions and preferences
#### for these brands are likely distinct and not highly interrelated.
#### 2) the correlation coefficient between rating of Wendy's and Burger King is relatively higher (0.4), which
#### suggests that Wendy's compete more directly with Burger King.
#### 3) the p-value is extremely less than 0.5, suggesting that the positive correlation (0.4) between 
#### Wendy's and Burger King is significant in the population, which further supports finding 2).

# 4. Wendy's position relative to Burger King
diff <- data.clean$rating_wendys - data.clean$rating_mcd

## calculate proportions of negative, positive, and zero values in the diff
prop_positive <- sum(diff > 0) / length(diff)
prop_negative <- sum(diff < 0) / length(diff)
prop_zero <- sum(diff == 0) / length(diff)
round(prop_positive, 2) # Wendy’s is rated higher than McDonald’s in 51% of cases (Most customers rate Wendy’s better than McDonald’s)
round(prop_negative, 2) # McDonald’s is rated higher than Wendy’s in 20% of cases
round(prop_zero, 2) # Wendy’s and McDonald’s are rated equally in 28% of cases

## Visualize above result using pie chart
png("Comparison of Wendy's and McDonald's Ratings.png", width = 800, height = 600)

proportions <- c(prop_positive, prop_negative, prop_zero)
labels <- c("Wendy's > McDonald's", "Wendy's < McDonald's", "Wendy's = McDonald's")
labels_with_values <- paste(labels, "(", round(proportions * 100, 1), "%)", sep = "")
pie(proportions, labels = labels_with_values, col = c("skyblue", "salmon", "lightgreen"), main = "Comparison of Wendy's and McDonald's Ratings")

dev.off()

## calculate the range of typical difference
quantile(diff, c(0.25, 0.75))
### **Key findings:**
### 1) a value of 0 at the 25th percentile suggests that at least a quarter of consumers rated Wendy’s the same or lower than McDonald’s.
### 2) a value of 2 at the 75th percentile suggests that at least three quarters of consumers rated Wendy's only up to 2 points higher than McDonald's
### 3) overall, most diff values fall between 0 and 2, indicating that many consumers rate Wendy’s similarly to, or only slightly higher than, McDonald’s.

#### Visualize above result using boxplot
png("Distribution of Wendy's vs McDonald's Ratings.png", width = 800, height = 600)

boxplot(diff, main = "Distribution of Wendy's vs McDonald's Ratings", 
        ylab = "Rating Difference", col = "skyblue", horizontal = TRUE)
quantiles <- quantile(diff, c(0.25, 0.75)) 
abline(v = quantiles, col = "red", lty = 2)  # Add vertical dashed lines for the quantiles
text(quantiles, rep(1.1, 2), labels = paste("Q", c("25", "75"), "=", round(quantiles, 2)), col = "red", pos = 4)

dev.off()
## conduct t-test
### H0: the mean rating of Wendy's is same as McDonald's
### HA: the mean ratings of Wendy's and McDonald's are different
t.test(data.clean$rating_wendys, data.clean$rating_mcd, alternative = "two.sided")
#### the significant result (p-value < 0.05) means Wendy’s is clearly favored in customer ratings compared to McDonald’s.

