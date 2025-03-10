# Wendy's Customer Satisfaction Analysis

## Project Overview

This project analyzes customer satisfaction ratings for major fast-food restaurants in the U.S., with a particular focus on Wendy's. The goal is to understand how Wendy's is perceived relative to its competitors, such as McDonald's, Burger King, and Subway. 

Key analysis and insights are outlined as follows:
1. **Comparative Analysis:**
    - Conduct a descriptive statistical analysis, including metrics such as mean, median, and standard deviation, to summarize customer satisfaction levels for each brand.
    - Use visualizations (e.g., boxplots) to display the distribution of ratings, offering a clear comparison of performance across brands.
2. **Correlation and Brand Positioning:** 
    - Generate a correlation matrix to examine how Wendy’s ratings correlate with its competitors’.
    - Perform a correlation hypothesis test to identify statistically significant relationships and provide insights into potential overlaps or distinctions in customer perceptions.
3. **Wendy's Position Relative to Its Strongest Competitor:** 
    - Analyze rating differences between Wendy’s and its strongest competitor (Burger King) to highlight specific areas of competitive advantage or disadvantage.
    - Use quantile analysis to understand the range of differences in customer satisfaction.
    - Conduct a one-sided hypothesis test to determine if Wendy’s mean rating is statistically higher than its competitor’s, supporting data-driven recommendations.

The R code utilized to clean, organize, analyze, and visualize the data can be found [here](analysis.R).

Visualizations and tables can be found [here](output).

## Dataset Desciption
This dataset contains 1450 observations across 15 variables, capturing demographic information, consumption patterns, patronage of various fast-food brands, and customer ratings. 
![data description](https://github.com/danfei-byte/Wendy-s-Customer-Satisfaction-Analysis/blob/main/output/Data%20Description.png?raw=true)

## Executive Summary
### Overview of Findings
This analysis evaluates Wendy’s customer satisfaction relative to its competitors: McDonald’s, Burger King, and Subway. Wendy’s achieves an average rating of 7.58 and a median score of 8, outperforming McDonald’s and Burger King but slightly trailing Subway (average 7.84, median 8). Wendy’s ratings also show strong consistency, highlighting its reliability in delivering positive customer experiences—a key competitive advantage.

Among competitors, Burger King emerges as Wendy’s closest rival, with a moderate correlation (0.4) in customer ratings, suggesting overlapping customer satisfaction drivers. This makes Burger King a critical reference point for refining Wendy’s marketing and branding strategies to further differentiate its position.

- **Comparative Analysis of Customer Ratings**
![comparative analysis](https://github.com/danfei-byte/Wendy-s-Customer-Satisfaction-Analysis/blob/main/output/Comparative_Analysis.png?raw=true)
![comparative analysis](https://github.com/danfei-byte/Wendy-s-Customer-Satisfaction-Analysis/blob/main/output/Customer_Ratings_Distribution.png?raw=true)
  - **Consistency in Customer Experience:** Wendy’s demonstrates strong reliability in customer satisfaction, **with a relatively low standard deviation (1.73)** compared to McDonald’s (2.03) and Burger King (1.86). While Subway shows the highest consistency (SD 1.72), Wendy’s is close, indicating a stable and predictable customer experience.
  - **Strong Performance in Customer Ratings:**
    1. Wendy’s achieves **an average satisfaction score of 7.58**, outperforming McDonald’s and Burger King and trailing only Subway (7.84).
    2. Wendy’s **median score of 8** places it at the top level among competitors, matching Subway and surpassing McDonald’s and Burger King, which indicates that the typical Wendy’s customer rates their experience highly.

- **Correlation and Brand Positioning**
![correlation](https://github.com/danfei-byte/Wendy-s-Customer-Satisfaction-Analysis/blob/main/output/Correlation.png?raw=true)
![correlation](https://github.com/danfei-byte/Wendy-s-Customer-Satisfaction-Analysis/blob/main/output/Correlation_Brand_Positioning.png?raw=true)
    - **Distinct Customer Perceptions:** Customer ratings for Wendy’s, McDonald’s, Burger King, and Subway do not strongly correlate (all correlation coefficients are below 0.5). This indicates that customers perceive these brands as distinct, with unique strengths and preferences influencing their ratings.
    - **Closer Competition with Burger King:** The relationship between Wendy’s and Burger King ratings stands out with a moderate positive correlation of 0.4. This suggests that Wendy’s competes more directly with Burger King, as their customer bases or perceptions may overlap more closely, this correlation is statistically significant at the population level.

- **Wendy’s Position Relative to Burger King**

    - **Wendy’s is Frequently Rated Higher:** Wendy’s is rated better than McDonald’s in 51% of cases, while McDonald’s is rated higher in only 20% of cases. For 28% of respondents, the two brands received equal ratings. This suggests that Wendy’s is generally perceived more favorably by customers than McDonald’s.
![comparison](https://github.com/danfei-byte/Wendy-s-Customer-Satisfaction-Analysis/blob/main/output/Comparison%20of%20Wendy's%20and%20McDonald's%20Ratings.png?raw=true)

    - **Moderate Differences in Ratings:**
        - At least 25% of customers rate Wendy’s the same or lower than McDonald’s. At least 75% of customers rate Wendy’s no more than 2 points higher than McDonald’s.
        - Most of the rating differences fall between 0 and 2 points, indicating that while Wendy’s has a competitive edge, the advantage is not overwhelming for many customers.
![comparison](https://github.com/danfei-byte/Wendy-s-Customer-Satisfaction-Analysis/blob/main/output/Distribution%20of%20Wendy's%20vs%20McDonald's%20Ratings.png?raw=true)
 
### Recommendations

- Highlight Wendy’s competitive edge in consistency and strong median performance to position the brand favorably.

- Since Wendy’s ratings do not strongly correlate with McDonald’s or Subway, these brands may target distinct customer segments, requiring a different competitive approach or less direct focus in the short term.

- Wendy’s already holds a slight edge over McDonald’s in customer perception. Marketing efforts should emphasize the aspects of Wendy’s that customers find superior, such as quality, taste, or freshness.

- While Wendy’s is generally rated higher, the narrow rating margins (0–2 points) suggest the competition is close. Continuous improvement in customer experience, product quality, and marketing differentiation will be essential to maintain and expand this lead over McDonald’s.

