# Cancer-Level-Prediction 
This project involves predicting the severity level of health conditions based on various factors such as age, lifestyle, and medical symptoms using a Random Forest classification model. The model aims to classify individuals into three categories: Low, Medium, or High severity based on the given features.

## Project Overview: 
- Objective: The goal is to build a predictive model to classify individuals based on their health condition severity.
- Data: The dataset contains information about individuals, including demographic details, lifestyle factors (e.g., smoking, alcohol use), and symptoms (e.g., chest pain, fatigue). The target variable is Level, which indicates the severity of the health condition.
- Model: A Random Forest classifier was used to train the model and predict the severity level.
- Accuracy: The model achieved 100% accuracy on the test set.

## Dataset:
The dataset used in this project contains the following columns:

- Environmental Factors:

1. Air.Pollution
2. Occupational.Hazards
3. Passive.Smoker
4. Lust.Allergy

- Lifestyle Factors:

1. Alcohol.use
2. Smoking
3. Balanced.Diet
4. Obesity

- Clinical Symptoms:

1. Chest.Pain
2. Coughing.of.Blood
3. Fatigue
4. Shortness.of.Breath
5. Wheezing
6. Weight.Loss

- Demographic Variables:

1. Gender

## Objectives:

- Data Exploration: Understand relationships between features and cancer severity.
- Feature Importance: Identify which features are most strongly associated with cancer levels.
- Predictive Modeling: Build a Random Forest classifier to predict the severity level of cancer.
- Model Evaluation: Validate the model's performance using accuracy, sensitivity, and specificity.

## Methodology:
1. Data Preprocessing:
- Normalized numerical variables to ensure consistency.
- Converted categorical variables (e.g., Level) into factors for model training.

2. Exploratory Data Analysis (EDA):
- Visualized the distributions of features (e.g., Obesity, Passive Smoker) across different cancer levels.
- Performed correlation analysis to quantify relationships between predictors and the target variable.

3. Model Training:
- Built a Random Forest classifier with 500 trees.
- Tuned hyperparameters for optimal performance.
- Evaluated feature importance using MeanDecreaseGini and MeanDecreaseAccuracy.

4. Model Validation:
- Used a confusion matrix to assess performance on the test set.
- Calculated metrics such as accuracy, sensitivity, and specificity.

## Visualization:
1. Air Pollution vs Obesity
2. Air Pollution vs Cancer Severity
3. Distribution of Health Risk Levels
4. Fatigue Distribution by Cancer Severity
5. Feature Importance Plot
6. Gender Distribution across Risk Levels
7. Genetic Risk vs Cancer Severity
8. Heatmap
9. Smoking vs Cancer Severity
## Results:

- Model Performance:

1. Training Set Accuracy: 100% (OOB error estimate: 0%).
2. Test Set Accuracy: 100% with perfect sensitivity and specificity for all classes.

- Feature Importance:
Top Predictors (by MeanDecreaseGini):
1. Level_numeric
2. Coughing.of.Blood
3. Obesity
4.Wheezing
5. Passive.Smoker

- Correlation Analysis: Strong correlations were observed between cancer severity and features like Obesity (r = 0.83), Coughing.of.Blood (r = 0.78), and Alcohol.use (r = 0.72).

## Required libraries:
```
library(tidyverse)
library(caret)
library(randomForest)
library(ggplot2)
library(corrplot)
```

## Conclusion:
- The Random Forest model achieved excellent performance with 100% accuracy on the test set.
- Key predictors like Coughing of Blood, Obesity, and Passive Smoking align with known risk factors for cancer.
- The insights can aid in early diagnosis and targeted interventions for individuals at higher risk of severe cancer.
