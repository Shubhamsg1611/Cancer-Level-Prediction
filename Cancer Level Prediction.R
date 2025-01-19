# Load libraries
library(tidyverse)
library(caret)
library(randomForest)
library(ggplot2)
library(corrplot)

setwd("C:/Users/shubh/OneDrive/Documents")
data <- read.csv("cancer patient data sets.csv")
str(data)
summary(data)

# Convert categorical columns to factors
data$Gender <- as.factor(data$Gender)
data$Level <- factor(data$Level, levels = c("Low", "Medium", "High"), ordered = TRUE)

# Check for missing values
sum(is.na(data))

# Identify numerical columns
numerical_columns <- sapply(data[, 4:24], is.numeric)

# Apply normalization only to numerical columns
data[, 4:24][, numerical_columns] <- lapply(data[, 4:24][, numerical_columns], normalize)

# Data Visualization:

ggplot(data, aes(x = Level, fill = Level)) +
  geom_bar() +
  theme_minimal() +
  labs(title = "Distribution of Health Risk Levels", x = "Risk Level", y = "Count")

ggplot(data, aes(x = Level, fill = Gender)) +
  geom_bar(position = "dodge") +
  theme_minimal() +
  labs(title = "Gender Distribution Across Risk Levels", x = "Risk Level", y = "Count")

ggplot(data, aes(x = Obesity, fill = Level)) + 
  geom_bar(position = "fill") + 
  labs(y = "Proportion", title = "Smoking vs Cancer Severity")

ggplot(data, aes(x = Level, y = Air.Pollution, fill = Level)) +
  geom_boxplot() +
  labs(title = "Air Pollution vs Cancer Severity", x = "Cancer Severity", y = "Air Pollution") +
  theme_minimal()

ggplot(data, aes(x = Air.Pollution, y = Obesity, color = Level)) +
  geom_point(alpha = 0.7, size = 2) +
  labs(title = "Air Pollution vs Obesity by Cancer Severity", x = "Air Pollution", y = "Obesity") +
  theme_minimal()

ggplot(data, aes(x = Fatigue, fill = Level)) +
  geom_density(alpha = 0.6) +
  labs(title = "Fatigue Distribution by Cancer Severity", x = "Fatigue", y = "Density") +
  theme_minimal()

ggplot(data, aes(x = Level, y = Genetic.Risk, fill = Level)) +
  geom_violin(trim = TRUE) +
  labs(title = "Genetic Risk by Cancer Severity", x = "Cancer Severity", y = "Genetic Risk") +
  theme_minimal()

ggplot(data, aes(x = Level, y = Fatigue, fill = Level)) +
  geom_boxplot() +
  facet_wrap(~ Smoking) +
  labs(title = "Fatigue vs Cancer Severity across Smoking Levels", x = "Cancer Severity", y = "Fatigue") +
  theme_minimal()


# Select only numeric columns from data
numeric_data <- data[, sapply(data, is.numeric)]

# Compute correlation matrix for all numeric columns
corr_matrix <- cor(numeric_data)

# Plot heatmap
library(corrplot)
corrplot(corr_matrix, method = "color", tl.cex = 0.7, number.cex = 0.7)

# Split data into training and testing sets
set.seed(123)
trainIndex <- createDataPartition(data$Level, p = 0.8, list = FALSE)
trainData <- data[trainIndex, ]
testData <- data[-trainIndex, ]

# Train the model
model <- randomForest(Level ~ ., data = trainData, importance = TRUE)

# Model summary
print(model)

# Feature importance plot
varImpPlot(model)

# Predict on the test set
predictions <- predict(model, newdata = testData)

# Confusion matrix
confusionMatrix(predictions, testData$Level)

# Convert 'Level' to numeric for correlation analysis
data$Level_numeric <- as.numeric(factor(data$Level, levels = c("Low", "Medium", "High")))

# Select numerical columns
numerical_columns <- sapply(data[, 4:24], is.numeric)

# Correlation of numerical predictors with 'Level_numeric'
correlation_results <- cor(data[, 4:24][, numerical_columns], data$Level_numeric, use = "complete.obs")
print(correlation_results)


library(randomForest)

# Convert categorical variables to factors and 'Level' to factor
data$Level <- as.factor(data$Level)

# Train a Random Forest model
model <- randomForest(Level ~ ., data = data[, -c(1, 2, 3)], importance = TRUE)

# Display feature importance
importance <- as.data.frame(importance(model))
print(importance[order(-importance$MeanDecreaseGini), ])