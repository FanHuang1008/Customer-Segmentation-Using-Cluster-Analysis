library(plotrix)
library(factoextra)

data <- read.csv('D:\\data\\Customer segmentation\\Mall_Customers.csv', header=T, sep=',')
str(data)

# Pie chart depicting ratio of male and female
gender <- table(data$Gender)
pie_pct <- round(gender / sum(gender) * 100)
pie_labels <- paste(c("Female", "Male"), pie_pct, "%", sep=" ")
pie3D(gender,
      labels = pie_labels,
      main = "Ratio of Female and Male")

# Box plot for age
boxplot(data$Age,
        col = "#003ab8",
        main = "Boxplot for age")


# Histogram for annual income
hist(data$Annual_Income,
     col = "#c90a0a",
     xlab = "Annual Income Class",
     main = "Histogram for Annual Income (k)")

# Histogram for spending score
hist(data$Spending_Score,
     col = "#1e9626",
     xlab = "Spending Score Class",
     main = "Histogram for Spending Score")


###########################
## Using three variables ##
###########################

# turn gender to numeric factor
data$Gender <- as.integer(factor(data$Gender)) - 1

# Elbow method for K-Means
fviz_nbclust(data[,2:5],
             FUNcluster = kmeans,
             method = "wss",
             k.max = 10) +
  labs(title = "Elbow metohd for K-means")


# Silhouette method for K-Means
fviz_nbclust(data[,2:5],
             FUNcluster = kmeans,
             method = "silhouette",
             k.max = 10) +
  labs(title = "Silhouette method for K-means")


set.seed(123)
km <- kmeans(data[,2:5], 7, iter.max=200, nstart = 50, algorithm="Hartigan-Wong")  
km


ggplot(data, aes(x = Annual_Income, y = Spending_Score)) + 
  geom_point(stat = "identity", aes(color = as.factor(km$cluster))) +
  scale_color_discrete(name = " ",
                       breaks = c("1", "2", "3", "4", "5", "6", "7"),
                       labels = c("Cluster 1", "Cluster 2", "Cluster 3", "Cluster 4", 
                                  "Cluster 5", "Cluster 6", "Cluster 7")) +
  ggtitle("Segmentation of Customers", subtitle = "Using K-means Clustering")



# 根據Age區分Cluster4與Cluster6
data$cluster = km$cluster
boxplot(data[data$cluster == 1, 'Age'], data[data$cluster == 4, 'Age'],
        main = "Age Distribution of Cluster 1 and Cluster 4",
        names = c("Cluster 1", "Cluster 4"),
        ylab = "Age",
        col = c("#E31351", "#002F65"))


# hierarchial clustering
hclust <- hclust(dist(data[,2:5]), method = "average")
plot(hclust)
abline(h=40, col="blue", lty=2, lwd=2)

