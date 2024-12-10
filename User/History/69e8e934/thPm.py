import pandas as pd

# Load the dataset from a CSV file
try:
    df = pd.read_csv('Admission.csv')
except FileNotFoundError:
    print("The file 'Admission.csv' was not found. Please check again")

# Displaying the first few rows of the dataset
print(df.head())

# Checking data types and missing values
print(df.info())
print(df.isnull().sum())