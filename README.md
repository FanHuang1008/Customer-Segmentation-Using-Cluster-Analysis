# Customer-Segmentation-Using-Cluster-Analysis

The first thing I did was to import the essential packages and read the csv file. To have better understanding of the customer dataset, I conducted basic data exploration by using the str( ) function.
 
Next, I wanted to know the gender composition, age distribution, frequency of annual income, and frequency of spending score across the customer dataset, so I visualized these variables.
 
From the graphs below, we could see that the percentage of females is 56% and the percentage of male is 44%. As for the age distribution, most customers’ age is between 27 and 50. The minimum age of customers is 18, whereas the maximum age is 70.
   
From the histograms below, we could say that people earning an average income of 70 have the highest frequency count. In addition, the annual income seems to have a normal distribution. We could also conclud that customers between class 40 and 50 have the highest spending score among all the classes.
  

Before performing the k-means clustering, I needed to specify the number of groups. Both elbow method and average silhouette method were used to find the optimal clusters.
 
Clustering results were visualized for better interpretation. From the dot plot below, we can see that there are 7 clusters:
Cluster 1 and Cluster 4 - These clusters represent the customer base with medium income salary as well as medium spending score.
Cluster 2 - This cluster represents a low annual income, but its yearly expenditure is high.
Cluster 3 - This cluster denotes a high annual income but low spending score.
Cluster 5 and Cluster 6 - These clusters represent the customer base with high annual income as well as high spending score. The annual income for customers that fall into     cluster 7 is higher.
Cluster 6 - This cluster denotes the customer base with low annual income as well as low yearly spend.
 
Since I wanted to find out whether age was the main reason that caused the separation of Cluster 1 and Cluster 4, I visualized the age distribution of these two clusters. From the boxplot, we can see that the difference is obvious, so I can say that my guessing is correct.
